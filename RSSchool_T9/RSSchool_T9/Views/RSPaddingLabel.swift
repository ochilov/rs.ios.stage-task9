//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSPaddingLabel: UILabel {
	@IBInspectable var topInset: CGFloat = 5.0
	@IBInspectable var bottomInset: CGFloat = 5.0
	@IBInspectable var leftInset: CGFloat = 5.0
	@IBInspectable var rightInset: CGFloat = 5.0

	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
		super.drawText(in: rect.inset(by: insets))
	}

	override var intrinsicContentSize: CGSize {
		get {
			var contentSize = super.intrinsicContentSize
			contentSize.height += topInset + bottomInset
			contentSize.width += leftInset + rightInset
			return contentSize
		}
	}
}
