//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

// MARK: - CollectionViewItemCell
class CollectionViewItemCell: UICollectionViewCell {
	static let reuseID = String(describing: CollectionViewItemCell.self)
	var imageView: UIImageView = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViews()
	}
	
	func setupViews() {
		contentView.layer.cornerRadius = 18
		contentView.layer.borderColor = UIColor.black.cgColor
		contentView.layer.borderWidth = 1.0
		
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 10
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.masksToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
		])
		
		imageView.image = UIImage(named:"minsk-0")
	}
	
	func update(withContent content: ContentType) {
		switch content {
		case .story(let story):
			imageView.image = story.coverImage
		case .gallery(let gallery):
			imageView.image = gallery.coverImage
		
		}
	}
}
