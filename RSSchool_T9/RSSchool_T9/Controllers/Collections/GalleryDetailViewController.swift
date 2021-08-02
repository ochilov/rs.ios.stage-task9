//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

// MARK: - GalleryDetailViewController
class GalleryDetailViewController: DetailViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
			flowlayout.invalidateLayout()
			let h = flowlayout.collectionViewContentSize.height
			collectionViewHeightConst?.constant = h
		}
	}
	var collectionViewHeightConst: NSLayoutConstraint? = nil
	private func setupViews() {
		contentView.addSubview(collectionView)
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
		])
		collectionViewHeightConst = collectionView.heightAnchor.constraint(equalToConstant: 500)
		collectionViewHeightConst?.isActive = true
		
		// !IMPORTANT: to correct calculate contentView HEIGHT
		contentView.bottomAnchor.constraint(greaterThanOrEqualTo: collectionView.bottomAnchor).isActive = true
	}
	
	//
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 20.0
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(GalleryItemCell.self, forCellWithReuseIdentifier: GalleryItemCell.reuseID)
		collectionView.backgroundColor = UIColor.detailBackground
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		return collectionView
	}()
	
	public var gallery: [UIImage] = []
	public func update(withContent content: Gallery) {
		coverView.imageView.image = content.coverImage
		coverView.title.text = content.title
		coverView.typeLabel.text = content.type
		gallery = content.images
	}

}

// MARK: UICollectionViewDataSource
extension GalleryDetailViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return gallery.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryItemCell.reuseID,
															for: indexPath) as? GalleryItemCell else {fatalError("Wrong cell")}
		cell.imageView.image = gallery[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		var space: CGFloat = 0.0
		if let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout {
			space = flowlayout.sectionInset.left
				  + flowlayout.sectionInset.right
				  + flowlayout.minimumInteritemSpacing
		}
		let width: CGFloat = (collectionView.frame.size.width - space)
		let height: CGFloat = width * 511/374

		return CGSize(width: width, height: height)
	}
}


// MARK: UICollectionViewDelegateFlowLayout
extension GalleryDetailViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = gallery[indexPath.item]
		let imageVC = ImageViewController()
		imageVC.imageView.image = item
		imageVC.modalPresentationStyle = .fullScreen
		present(imageVC, animated: true)
	}
}


// MARK: - CollectionViewItemCell
class GalleryItemCell: UICollectionViewCell {
	static let reuseID = String(describing: GalleryItemCell.self)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViews()
	}
	
	
	public var imageView: UIImageView = UIImageView()
	func setupViews() {
		// content with border
		contentView.layer.cornerRadius = 8
		contentView.layer.borderColor = UIColor.detailBorder.cgColor
		contentView.layer.borderWidth = 1.0
		
		
		// image view with border
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 4
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.detailBorder.cgColor
		imageView.layer.masksToBounds = true
		contentView.addSubview(imageView)
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		])
	}
}
