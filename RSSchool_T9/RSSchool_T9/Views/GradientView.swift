//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GradientView: UIView {

	private let gradient : CAGradientLayer = CAGradientLayer()
	private let gradientStartColor: UIColor
	private let gradientEndColor: UIColor

	init(gradientStartColor: UIColor, gradientEndColor: UIColor) {
		self.gradientStartColor = gradientStartColor
		self.gradientEndColor = gradientEndColor
		super.init(frame: .zero)
		
		gradient.frame = self.bounds
		gradient.colors = [gradientEndColor.cgColor, gradientStartColor.cgColor]
		gradient.startPoint = .init(x: 0.0, y: 0.0)
		gradient.endPoint = .init(x: 0.0, y: 1.0)
		self.layer.insertSublayer(gradient, at: 0)
	}

	required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	override func layoutSublayers(of layer: CALayer) {
		super.layoutSublayers(of: layer)
		gradient.frame = self.bounds
	}
}
