//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailCoverView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func setupViews() {
		
		// image-view with border
		self.addSubview(imageView)
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: imageView.bounds.height / imageView.bounds.width)
		])
		
		
		// gradient on image-view
		let gradientView = GradientView(gradientStartColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1.0),
										  gradientEndColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.0))
		gradientView.layer.cornerRadius = imageView.layer.cornerRadius
		gradientView.layer.masksToBounds = true
		self.addSubview(gradientView)
		gradientView.translatesAutoresizingMaskIntoConstraints = false
		let borderWidth = imageView.layer.borderWidth
		NSLayoutConstraint.activate([
			gradientView.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.35),
			gradientView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -borderWidth),
			gradientView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: borderWidth),
			gradientView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -borderWidth),
		])
		
		
		// title-label with border
		self.addSubview(title)
		NSLayoutConstraint.activate([
			title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
			title.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
			title.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -35)
		])
		
		
		// type-label with border
		self.addSubview(typeLabel)
		let typeLabelHeight: CGFloat = 40
		NSLayoutConstraint.activate([
			typeLabel.heightAnchor.constraint(equalToConstant: typeLabelHeight),
			typeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
			typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -typeLabelHeight/2),
		])
		
		
		// devider
		let devider = UIView()
		devider.layer.borderWidth = 1
		devider.layer.borderColor = UIColor.detailBorder.cgColor
		self.addSubview(devider)
		
		devider.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			devider.heightAnchor.constraint(equalToConstant: 1),
			devider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
			devider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
			devider.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 58),
		])
		
		// set view bottom anchor to correct calculate view bounds
		self.bottomAnchor.constraint(greaterThanOrEqualTo: devider.bottomAnchor, constant: 10).isActive = true
	}
	
	//
	public lazy var imageView: UIImageView = {
		let imageView = UIImageView(frame: .init(x: 20, y: 20, width: 374, height: 500))
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 8
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.detailBorder.cgColor
		imageView.layer.masksToBounds = true
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//
	public lazy var title: UILabel = {
		let title = UILabel()
		title.font = UIFont(name: "Rockwell", size: 48)
		title.textColor = UIColor.detailBorder
		title.numberOfLines = 0
		title.contentMode = .bottomLeft
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()
	
	//
	public lazy var typeLabel: UILabel = {
		let typeLabel = RSPaddingLabel()
		typeLabel.font = UIFont(name: "Rockwell", size: 24)
		typeLabel.textColor = UIColor.detailBorder
		typeLabel.backgroundColor = UIColor.detailBackground
		typeLabel.numberOfLines = 1
		typeLabel.contentMode = .center
		typeLabel.topInset = 8
		typeLabel.bottomInset = 3
		typeLabel.leftInset = 30
		typeLabel.rightInset = 30
		typeLabel.layer.cornerRadius = 8
		typeLabel.layer.borderWidth = 1
		typeLabel.layer.borderColor = UIColor.detailBorder.cgColor
		typeLabel.layer.masksToBounds = true
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		return typeLabel
	}()
}
