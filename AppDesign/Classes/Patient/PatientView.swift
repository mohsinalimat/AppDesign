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
class PatientView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var viewFooter: UIView!
	@IBOutlet var collectionView: UICollectionView!
	
	@IBOutlet var cellFirstname: UITableViewCell!
	@IBOutlet var cellLastname: UITableViewCell!
	@IBOutlet var cellPatientRecord: UITableViewCell!
	@IBOutlet var cellDateOfBirth: UITableViewCell!
	@IBOutlet var cellPhoneNumber: UITableViewCell!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Patient"

		tableView.tableFooterView = viewFooter

		let width = UIScreen.main.bounds.size.width
		viewFooter.frame = CGRect(x: 0, y: 0, width: width, height: width/2)

		collectionView.register(UINib(nibName: "PatientCell", bundle: nil), forCellWithReuseIdentifier: "PatientCell")
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension PatientView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 5 }
		if (section == 1) { return 0 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 30
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return "About"	}
		if (section == 1) { return "Photos"	}

		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellFirstname		}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellLastname		}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellPatientRecord	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellDateOfBirth	}
		if (indexPath.section == 0) && (indexPath.row == 4) { return cellPhoneNumber	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension PatientView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension PatientView: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 16
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PatientCell", for: indexPath) as! PatientCell
	
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension PatientView: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = UIScreen.main.bounds.size.width
		return CGSize(width: width/4, height: width/4)
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension PatientView: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		collectionView.deselectItem(at: indexPath, animated: true)
	}
}
