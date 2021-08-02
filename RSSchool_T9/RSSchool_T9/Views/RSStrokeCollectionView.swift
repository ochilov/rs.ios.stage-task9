//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit


class RSStrokeCollectionView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupViews() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 100.0
		layout.itemSize = .init(width: 75, height: 100)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 50, bottom: 20, right: 20)
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
		collectionView.backgroundColor = UIColor.detailBackground
		collectionView.dataSource = self
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(collectionView)
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	public var paths:[CGPath] = []
}

// MARK: UICollectionViewDataSource
extension RSStrokeCollectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return paths.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell",
															for: indexPath)
		
		let path = paths[indexPath.item]
		
		let view = cell.contentView
		let shape = CAShapeLayer()
		shape.bounds = view.bounds
		shape.position = view.center
		shape.path = path
		shape.strokeColor = UIColor(hex: RSSettings.defaultSettings.drawStoriesColor).cgColor
		shape.fillColor = UIColor.detailBackground.cgColor
		shape.lineWidth = 1
		shape.strokeStart = 0.0
		shape.strokeEnd = 1.0
		
		view.layer.sublayers = [shape]
		
		if RSSettings.defaultSettings.drawStoriesOn {
			shape.strokeEnd = 0.0
			let animateDraw = CABasicAnimation(keyPath: "strokeEnd")
			animateDraw.fromValue = 0.0
			animateDraw.toValue = 1.0
			animateDraw.duration = 3.0
			animateDraw.repeatCount = 0
			animateDraw.autoreverses = false
			animateDraw.isRemovedOnCompletion = false
			animateDraw.fillMode = .forwards
			shape.add(animateDraw, forKey: "strokeEnd")
		}
		
		return cell
	}
}

