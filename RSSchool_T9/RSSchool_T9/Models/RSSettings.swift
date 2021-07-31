//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 31.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSSettings: NSObject {
	
	@objc public var drawStoriesOn: Bool = true
	@objc public var drawStoriesColor: String = "";
	
	@objc static let defaultSettings: RSSettings = {
		let instance = RSSettings()
		instance.drawStoriesOn = true
		instance.drawStoriesColor = "#f3af22"
		return instance
	}()

}
