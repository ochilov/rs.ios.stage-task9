//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

@IBDesignable
class RSPaddingLabel: UILabel {
	var textEdgeInsets = UIEdgeInsets.zero {
		didSet { invalidateIntrinsicContentSize() }
	}
	
	open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
		let insetRect = bounds.inset(by: textEdgeInsets)
		let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
		return textRect.inset(by: textEdgeInsets.inverted())
	}
	
	override func drawText(in rect: CGRect) {
		super.drawText(in: rect.inset(by: textEdgeInsets))
	}
	
	@IBInspectable
	var paddingLeft: CGFloat {
		set { textEdgeInsets.left = newValue }
		get { return textEdgeInsets.left }
	}
	
	@IBInspectable
	var paddingRight: CGFloat {
		set { textEdgeInsets.right = newValue }
		get { return textEdgeInsets.right }
	}
	
	@IBInspectable
	var paddingTop: CGFloat {
		set { textEdgeInsets.top = newValue }
		get { return textEdgeInsets.top }
	}
	
	@IBInspectable
	var paddingBottom: CGFloat {
		set { textEdgeInsets.bottom = newValue }
		get { return textEdgeInsets.bottom }
	}
}

extension UIEdgeInsets {
	func inverted() -> UIEdgeInsets {
		return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
	}
}
