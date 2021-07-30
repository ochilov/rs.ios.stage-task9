//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
		let window = UIWindow(windowScene: windowScene)
		
		window.rootViewController = rootViewController
		
		self.window = window
		window.makeKeyAndVisible()
    }
	
	private var rootViewController: UIViewController {
		let tabBar = UITabBarController()
		
		// add view controllers
		let collectionsVC = CollectionsViewController()
		let settingsVC = SettingsViewController()
		tabBar.setViewControllers([collectionsVC, settingsVC], animated: false)
		
		return tabBar
	}
}

