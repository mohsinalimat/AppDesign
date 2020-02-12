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

import ProgressHUD

//-------------------------------------------------------------------------------------------------------------------------------------------------
class SettingsView: UITableViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelInitials: UILabel!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var cellProfile: UITableViewCell!
	@IBOutlet var cellPassword: UITableViewCell!
	@IBOutlet var cellStatus: UITableViewCell!
	@IBOutlet var cellBlocked: UITableViewCell!
	@IBOutlet var cellArchive: UITableViewCell!
	@IBOutlet var cellCache: UITableViewCell!
	@IBOutlet var cellMedia: UITableViewCell!
	@IBOutlet var cellWallpapers: UITableViewCell!
	@IBOutlet var cellPrivacy: UITableViewCell!
	@IBOutlet var cellTerms: UITableViewCell!
	@IBOutlet var cellLogout: UITableViewCell!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"

		tableView.tableHeaderView = viewHeader
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionProfile() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionPassword() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionStatus() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionBlocked() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionArchive() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionCache() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionMedia() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionWallpapers() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionPrivacy() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionTerms() {

	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func actionLogout() {

	}

	// MARK: - Table view data source
	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func numberOfSections(in tableView: UITableView) -> Int {

		return 5
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 2 }
		if (section == 1) { return 1 }
		if (section == 2) { return 5 }
		if (section == 3) { return 2 }
		if (section == 4) { return 1 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 1) { return "Status" }

		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellProfile			}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellPassword			}
		if (indexPath.section == 1) && (indexPath.row == 0) { return cellStatus				}
		if (indexPath.section == 2) && (indexPath.row == 0) { return cellBlocked			}
		if (indexPath.section == 2) && (indexPath.row == 1) { return cellArchive			}
		if (indexPath.section == 2) && (indexPath.row == 2) { return cellCache				}
		if (indexPath.section == 2) && (indexPath.row == 3) { return cellMedia				}
		if (indexPath.section == 2) && (indexPath.row == 4) { return cellWallpapers			}
		if (indexPath.section == 3) && (indexPath.row == 0) { return cellPrivacy			}
		if (indexPath.section == 3) && (indexPath.row == 1) { return cellTerms				}
		if (indexPath.section == 4) && (indexPath.row == 0) { return cellLogout				}

		return UITableViewCell()
	}

	// MARK: - Table view delegate
	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		if (indexPath.section == 0) && (indexPath.row == 0) { actionProfile()			}
		if (indexPath.section == 0) && (indexPath.row == 1) { actionPassword()			}
		if (indexPath.section == 1) && (indexPath.row == 0) { actionStatus()			}
		if (indexPath.section == 2) && (indexPath.row == 0) { actionBlocked()			}
		if (indexPath.section == 2) && (indexPath.row == 1) { actionArchive()			}
		if (indexPath.section == 2) && (indexPath.row == 2) { actionCache()				}
		if (indexPath.section == 2) && (indexPath.row == 3) { actionMedia()				}
		if (indexPath.section == 2) && (indexPath.row == 4) { actionWallpapers()		}
		if (indexPath.section == 3) && (indexPath.row == 0) { actionPrivacy()			}
		if (indexPath.section == 3) && (indexPath.row == 1) { actionTerms()				}
		if (indexPath.section == 4) && (indexPath.row == 0) { actionLogout()			}
	}
}
