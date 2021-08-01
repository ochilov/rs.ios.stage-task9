//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation

@objc extension UIColor {
	public convenience init(hex: String) {
		var rgb:UInt32 = 0
		if hex.hasPrefix("#") {
			rgb = UInt32(hex.dropFirst(), radix: 16) ?? 0
		} else if hex.hasPrefix("0x") {
			rgb = UInt32(hex.dropFirst(2), radix: 16) ?? 0
		} else {
			rgb = UInt32(hex, radix: 16) ?? 0
		}
		self.init(rgb:rgb)
	}
	
	public convenience init(rgb: UInt32) {
		let b = (rgb >> 0) & 0xFF;
		let g = (rgb >> 8) & 0xFF;
		let r = (rgb >> 16) & 0xFF;
		self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
	}
	
	open class var controlBackground: UIColor {
		get {
			return UIColor(named: "controlBackgroundColor") ?? UIColor.systemGray6
		}
	}
	
	// content colors
	open class var contentBackground: UIColor {
		get {
			return UIColor(named: "contentBackgroundColor") ?? UIColor.systemBackground
		}
	}
	open class var contentBorder: UIColor {
		get {
			return UIColor(named: "contentBorderColor") ?? UIColor.black
		}
	}
	
	// detail-module colors
	open class var detailBackground: UIColor {
		get {
			return UIColor(named: "detailBackgroundColor") ?? UIColor.black
		}
	}
	open class var detailBorder: UIColor {
		get {
			return UIColor(named: "detailBorderColor") ?? UIColor.white
		}
	}
}
