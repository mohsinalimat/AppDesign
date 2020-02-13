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

//-------------------------------------------------------------------------------------------------------------------------------------------------
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("ContactsView")
		names.append("GroupsView")
		names.append("LoginView")
		names.append("PasswordView")
		names.append("PatientView")
		names.append("RegisterView")
		names.append("SelectUserView")
		names.append("SettingsView")
		names.append("StatusView")
		names.append("StickersView")
		names.append("WelcomeView")
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)
		
		switch names[indexPath.row] {

			case "ContactsView":
				let contactsView = ContactsView()
				let navController = UINavigationController(rootViewController: contactsView)
				present(navController, animated: true)

			case "GroupsView":
				let groupsView = GroupsView()
				navigationController?.pushViewController(groupsView, animated: true)

			case "LoginView":
				let loginView = LoginView()
				present(loginView, animated: true)

			case "PasswordView":
				let passwordView = PasswordView()
				let navController = UINavigationController(rootViewController: passwordView)
				present(navController, animated: true)

			case "PatientView":
				let patientView = PatientView()
				navigationController?.pushViewController(patientView, animated: true)

			case "RegisterView":
				let registerView = RegisterView()
				present(registerView, animated: true)

			case "SelectUserView":
				let selectUserView = SelectUserView()
				let navController = NavigationController(rootViewController: selectUserView)
				present(navController, animated: true)

			case "SettingsView":
				let settingsView = SettingsView()
				navigationController?.pushViewController(settingsView, animated: true)

			case "StatusView":
				let statusView = StatusView()
				navigationController?.pushViewController(statusView, animated: true)

			case "StickersView":
				let stickersView = StickersView()
				let navController = NavigationController(rootViewController: stickersView)
				present(navController, animated: true)

			case "WelcomeView":
				let welcomeView = WelcomeView()
				present(welcomeView, animated: true)

			default:
				break
		}
	}
}
