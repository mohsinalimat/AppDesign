//
// Copyright (c) 2020 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Contacts
import ProgressHUD

//-------------------------------------------------------------------------------------------------------------------------------------------------
class ContactsView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var selection: [String] = []

	private var contacts: [[String: String]] = []
	private var numbers: [String: [String]] = [:]
	private var emails: [String: [String]] = [:]

	private var sections: [[[String: String]]] = []
	private let collation = UILocalizedIndexedCollation.current()

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Contacts"

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionCancel))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(actionDone))

		tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")

		tableView.tableFooterView = UIView()

		loadContacts()
	}

	// MARK: - Contact methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadContacts() {

		contacts.removeAll()

		let store = CNContactStore()
		store.requestAccess(for: .contacts, completionHandler: { granted, error in
			if (granted) {
				let predicate = CNContact.predicateForContactsInContainer(withIdentifier: store.defaultContainerIdentifier())
				let keys = [CNContactFamilyNameKey as CNKeyDescriptor, CNContactGivenNameKey as CNKeyDescriptor,
							CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactEmailAddressesKey as CNKeyDescriptor]
				if let cncontacts = try? store.unifiedContacts(matching: predicate, keysToFetch: keys) {
					for cncontact in cncontacts {
						self.addContact(cncontact)
					}
				}
				DispatchQueue.main.async {
					self.setObjects()
				}
			}
		})
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setObjects() {

		sections.removeAll()

		let selector = #selector(NSDictionary.fullname)
		sections = Array(repeating: [], count: collation.sectionTitles.count)

		if let sorted = collation.sortedArray(from: contacts, collationStringSelector: selector) as? [[String: String]] {
			for contact in sorted {
				let section = collation.section(for: contact, collationStringSelector: selector)
				sections[section].append(contact)
			}
		}

		refreshTableView()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func addContact(_ cncontact: CNContact) {

		let contactId = cncontact.identifier

		let firstname = cncontact.givenName
		let lastname = cncontact.familyName

		let initial1 = (firstname.count != 0) ? firstname.prefix(1) : ""
		let initial2 = (lastname.count != 0) ? lastname.prefix(1) : ""

		let initials = "\(initial1)\(initial2)"
		let fullname = "\(firstname) \(lastname)"

		var phoneNumbers: [String] = []
		for labeledValue in cncontact.phoneNumbers {
			if let number = labeledValue.value.value(forKey: "digits") as? String {
				phoneNumbers.append(number)
			}
		}
		numbers[contactId] = phoneNumbers

		var emailAddresses: [String] = []
		for labeledValue in cncontact.emailAddresses {
			let email = labeledValue.value as String
			emailAddresses.append(email)
		}
		emails[contactId] = emailAddresses

		contacts.append(["contactId": contactId, "initials": initials, "fullname": fullname])
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionCancel() {

		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone() {

		dismiss(animated: true)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension ContactsView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return sections.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return sections[section].count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		return (sections[section].count != 0) ? collation.sectionTitles[section] : nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {

		return collation.sectionIndexTitles
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {

		return collation.section(forSectionIndexTitle: index)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell

		let contact = sections[indexPath.section][indexPath.row]

		cell.bindData(contact: contact)

		if let contactId = contact["contactId"] {
			cell.accessoryType = selection.contains(contactId) ? .checkmark : .none
		}

		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension ContactsView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		let contact = sections[indexPath.section][indexPath.row]
		if let contactId = contact["contactId"] {
			if (selection.contains(contactId)) {
				selection.removeObject(contactId)
			} else {
				selection.append(contactId)
			}

			if let cell = tableView.cellForRow(at: indexPath) {
				cell.accessoryType = selection.contains(contactId) ? .checkmark : .none
			}
		}
	}
}
