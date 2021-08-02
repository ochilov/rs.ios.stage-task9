//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSCloseButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)
		initStyle()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	private func initStyle() {
		self.layer.masksToBounds = true
		self.layer.cornerRadius = self.bounds.size.width/2
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.detailBorder.cgColor
		self.tintColor = UIColor.detailBorder
		
		self.setImage(UIImage(systemName: "xmark"), for: .normal)
	}
}
