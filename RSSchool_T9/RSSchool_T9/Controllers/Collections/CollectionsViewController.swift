//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit


// MARK: - CollectionsViewController
class CollectionsViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initStyle()
		setupViews()
		initData()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowlayout.invalidateLayout()
		}
	}
	
	// view style
	private func initStyle() {
		self.view.layer.backgroundColor = UIColor.contentBackground.cgColor
	}
	
	// collection view style
	private var collectionViewNumberOfColumns: CGFloat = 2
	private var collectionViewSpacing: CGFloat = 16
	private var collectionViewEdges: CGFloat = 20
	private var collectionView: UICollectionView! = nil
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = collectionViewSpacing
		layout.minimumInteritemSpacing = collectionViewSpacing
		layout.itemSize = .init(width: 179, height: 220)
		layout.sectionInset = UIEdgeInsets(top: 40, left: collectionViewEdges, bottom: 50, right: collectionViewEdges)
		
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(CollectionViewItemCell.self, forCellWithReuseIdentifier: CollectionViewItemCell.reuseID)
		
		collectionView.backgroundColor = UIColor.contentBackground
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
	
	
	private func setupViews() {
		setupCollectionView()
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(collectionView)
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	private var datasource:[ContentType]? = nil
	private func initData() {
		datasource = FillingData.data
	}
}


// MARK: UICollectionViewDataSource
extension CollectionsViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return datasource?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewItemCell.reuseID,
															for: indexPath) as? CollectionViewItemCell else {fatalError("Wrong cell")}
		
		guard let item = datasource?[indexPath.item] else {fatalError("No item")}
		cell.update(withContent: item)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else {return .init(width: 20, height: 20)}
		
		var leftEdge  = collectionViewEdges
		var rightEdge = collectionViewEdges
		var minSpace  = collectionViewSpacing
		var itemWidth = flowlayout.itemSize.width
		let columns   = collectionViewNumberOfColumns
		
		
		let realWidth = collectionView.frame.size.width-2
		let needWidth = leftEdge
					  + rightEdge
					  + minSpace  * columns - 1
					  + itemWidth * columns
		
		if realWidth >= needWidth {
			// calc free space
			let widthSpace = realWidth - needWidth
			// proportional split free space
			itemWidth += widthSpace * (itemWidth / needWidth)
			leftEdge  += widthSpace * (leftEdge / needWidth)
			rightEdge += widthSpace * (rightEdge / needWidth)
			minSpace   = (realWidth - itemWidth * columns
									- leftEdge
									- rightEdge) / (columns - 1)
		} else {
			// item width constraints with min values of edges and interspaces
			itemWidth = (realWidth - leftEdge - rightEdge - minSpace * (columns-1)) / columns
		}
		
		// update layout with new data
		flowlayout.sectionInset.left  = leftEdge
		flowlayout.sectionInset.right = rightEdge
		flowlayout.minimumInteritemSpacing = minSpace
		
		return CGSize(width: itemWidth, height: itemWidth * flowlayout.itemSize.height / flowlayout.itemSize.width)
	}
}


// MARK: UICollectionViewDelegateFlowLayout
extension CollectionsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let item = datasource?[indexPath.item] else {fatalError("No item")}
		
		var detailViewController: DetailViewController? = nil
		switch item {
		case .gallery(let gallerey):
			let vc = GalleryDetailViewController()
			vc.update(withContent: gallerey)
			detailViewController = vc
		case .story(let story):
			let vc = StoryDetailViewController()
			vc.update(withContent: story)
			detailViewController = vc
		}
		
		guard let detailViewController = detailViewController else {return}
		detailViewController.modalPresentationStyle = .fullScreen
		present(detailViewController, animated: true)
	}
}
