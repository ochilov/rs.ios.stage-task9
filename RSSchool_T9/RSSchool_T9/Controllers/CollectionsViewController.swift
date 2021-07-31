//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 30.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CollectionsViewController: UIViewController {
	convenience init() {
		self.init(nibName:nil, bundle:nil)
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViews()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	private func setupViews() {
		self.view.layer.backgroundColor = UIColor.systemBackground.cgColor
	}
}
