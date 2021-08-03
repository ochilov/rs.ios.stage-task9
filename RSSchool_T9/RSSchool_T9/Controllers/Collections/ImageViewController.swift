//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 02.08.2021
// 
// Copyright © 2021 JohnO. All rights reserved.

import UIKit

class ImageViewController: UIViewController {
	private var image: UIImage
	init(image: UIImage) {
		self.image = image
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		imageScrollView.resetZoom()
	}
	
	// setup content views
	private func setupViews() {
		self.view.backgroundColor = UIColor.detailBackground
		self.view.addSubview(imageScrollView)
		self.view.addSubview(closeButton)
		imageScrollView.set(image: image)
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
		self.view.isUserInteractionEnabled = true
		self.view.addGestureRecognizer(tapGesture)
		
		let layoutGuide = self.view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			closeButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 30),
			closeButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -25),
			closeButton.widthAnchor.constraint(equalToConstant: closeButton.bounds.width),
			closeButton.heightAnchor.constraint(equalToConstant: closeButton.bounds.height),
			
			imageScrollView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
			imageScrollView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
			imageScrollView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
			imageScrollView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
		])
	}
	
	//
	public lazy var imageScrollView: ImageScrollView = {
		let imageView = ImageScrollView(frame: view.bounds)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//
	public lazy var closeButton: RSCloseButton = {
		let closeButton = RSCloseButton(frame: .init(x: 0, y: 0, width: 40, height: 40))
		closeButton.addTarget(self, action: #selector(onClose(sender:)), for: .touchUpInside)
		closeButton.translatesAutoresizingMaskIntoConstraints = false
		return closeButton
	}()
	
	@objc private func onClose(sender: UIButton) {
		dismiss(animated: true)
	}
	
	//
	@objc private func viewTapped(_ sender: UITapGestureRecognizer) {
		self.closeButton.isHidden = !self.closeButton.isHidden
	}
}
