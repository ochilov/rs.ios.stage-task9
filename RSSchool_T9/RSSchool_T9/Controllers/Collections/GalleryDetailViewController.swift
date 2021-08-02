//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 02.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryDetailViewController: DetailViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	
	public func update(withContent content: Gallery) {
		coverView.imageView.image = content.coverImage
		coverView.title.text = content.title
		coverView.typeLabel.text = content.type
	}

}
