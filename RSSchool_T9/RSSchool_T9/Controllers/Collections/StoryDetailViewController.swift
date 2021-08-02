//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryDetailViewController: DetailViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}
	
	private func setupViews() {
		// icons (stackview)
		contentView.addSubview(strokeCollectionView)
		NSLayoutConstraint.activate([
			strokeCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
			strokeCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			strokeCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			strokeCollectionView.heightAnchor.constraint(equalToConstant: 140)
		])
		
		// story-content
		contentView.addSubview(contentText)
		NSLayoutConstraint.activate([
			contentText.topAnchor.constraint(equalTo: strokeCollectionView.bottomAnchor, constant: 10),
			contentText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
		])
		
		// !IMPORTANT: to correct calculate contentView HEIGHT
		contentView.bottomAnchor.constraint(greaterThanOrEqualTo: contentText.bottomAnchor).isActive = true
	}
	
	//
	public lazy var strokeCollectionView: RSStrokeCollectionView = {
		let strokeCollectionView = RSStrokeCollectionView()
		strokeCollectionView.translatesAutoresizingMaskIntoConstraints = false
		return strokeCollectionView
	}()
	
	//
	public lazy var contentText: RSPaddingLabel = {
		let contentText = RSPaddingLabel()
		contentText.font = UIFont(name: "Rockwell", size: 24)
		contentText.textColor = UIColor.detailBorder
		contentText.numberOfLines = 0
		contentText.lineBreakMode = .byWordWrapping
		contentText.contentMode = .topRight
		contentText.topInset = 30
		contentText.bottomInset = 30
		contentText.leftInset = 30
		contentText.rightInset = 40
		contentText.backgroundColor = UIColor.detailBackground
		contentText.layer.cornerRadius = 8
		contentText.layer.borderWidth = 1
		contentText.layer.borderColor = UIColor.detailBorder.cgColor
		contentText.layer.masksToBounds = true
		contentText.translatesAutoresizingMaskIntoConstraints = false
		return contentText
	}()
	
	public func update(withContent content: Story) {
		coverView.imageView.image = content.coverImage
		coverView.title.text = content.title
		coverView.typeLabel.text = content.type
		contentText.text = content.text
		strokeCollectionView.paths = content.paths
	}
}
