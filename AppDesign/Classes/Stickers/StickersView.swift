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
class StickersView: UIViewController {

	@IBOutlet var collectionView: UICollectionView!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Stickers"

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(actionDismiss))

		collectionView.register(UINib(nibName: "StickersCell", bundle: nil), forCellWithReuseIdentifier: "StickersCell")
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDismiss() {

		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension StickersView: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 30
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StickersCell", for: indexPath) as! StickersCell

		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension StickersView: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let screenWidth = UIScreen.main.bounds.size.width
		return CGSize(width: screenWidth/3, height: screenWidth/3)
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension StickersView: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		collectionView.deselectItem(at: indexPath, animated: true)
		actionDismiss()
	}
}
