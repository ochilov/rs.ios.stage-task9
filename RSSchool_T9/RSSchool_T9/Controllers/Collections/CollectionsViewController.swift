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
	private var collectionView: UICollectionView! = nil
	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 16
		layout.minimumInteritemSpacing = 16
		layout.sectionInset = UIEdgeInsets(top: 40, left: 20, bottom: 50, right: 20)
		
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

		var space: CGFloat = 0.0
		if let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout {
			space = flowlayout.sectionInset.left
				  + flowlayout.sectionInset.right
				  + flowlayout.minimumInteritemSpacing * (collectionViewNumberOfColumns - 1)
		}
		var width: CGFloat = (collectionView.frame.size.width - space) / collectionViewNumberOfColumns
		
		// limit max size
		let maxWidth: CGFloat = (max(collectionView.frame.size.width, collectionView.frame.size.height) - space) / collectionViewNumberOfColumns * 0.75
		width = min(width, maxWidth)
		let height = width * 1.22905

		return CGSize(width: width, height: height)
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
