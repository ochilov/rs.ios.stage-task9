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
	var typeLabel: UILabel = UILabel()
	var title: UILabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViews()
	}
	
	func setupViews() {
		// content with border
		contentView.layer.cornerRadius = 18
		contentView.layer.borderColor = UIColor.black.cgColor
		contentView.layer.borderWidth = 1.0
		
		
		// image view with border
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 10
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		imageView.layer.masksToBounds = true
		contentView.addSubview(imageView)
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
		])
		
		
		// gradient on image view
		let gradientView = GradientView(gradientStartColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0),
										  gradientEndColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.0))
		gradientView.layer.cornerRadius = imageView.layer.cornerRadius
		gradientView.layer.masksToBounds = true
		contentView.addSubview(gradientView)
		
		gradientView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			gradientView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.35),
			gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
			gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
			gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
		])
		
		
		// type label
		typeLabel.font = UIFont(name: "Rockwell", size: 12)
		typeLabel.textColor = UIColor(hex: "#B6B6B6")
		contentView.addSubview(typeLabel)
		
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			typeLabel.heightAnchor.constraint(equalToConstant: 14),
			typeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13),
			typeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
			typeLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
		])
		
		
		// title label
		title.font = UIFont(name: "Rockwell", size: 16)
		title.textColor = .white
		contentView.addSubview(title)
		
		title.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			title.heightAnchor.constraint(equalToConstant: 19),
			title.bottomAnchor.constraint(equalTo: typeLabel.topAnchor, constant: -3),
			title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
			title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -15),
		])
	}
	
	func update(withContent content: ContentType) {
		switch content {
		case .story(let story):
			imageView.image = story.coverImage
			typeLabel.text = story.type
			title.text = story.title
		case .gallery(let gallery):
			imageView.image = gallery.coverImage
			typeLabel.text = gallery.type
			title.text = gallery.title
		}
	}
}
