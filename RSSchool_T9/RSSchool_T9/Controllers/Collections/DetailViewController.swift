//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 01.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit


// MARK:- ContentViewController
class DetailViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		initStyle()
		setupViews()
	}
	
	private func initStyle() {
		self.view.layer.backgroundColor = UIColor.detailBackground.cgColor
	}
	
	private func setupViews() {
		self.view.addSubview(scrollView)
		NSLayoutConstraint.activate([
			scrollView.frameLayoutGuide.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
			scrollView.frameLayoutGuide.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
			scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
		])
		let layoutGuide = scrollView.contentLayoutGuide
		let edgeMargin: CGFloat = 20
		
		// close-button
		scrollView.addSubview(closeButton)
		NSLayoutConstraint.activate([
			closeButton.widthAnchor.constraint(equalToConstant: closeButton.frame.size.width),
			closeButton.heightAnchor.constraint(equalToConstant: closeButton.frame.size.height),
			closeButton.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 30),
			closeButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -25)
		])
		
		// detail-intro: cover
		scrollView.addSubview(coverView)
		NSLayoutConstraint.activate([
			coverView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 100),
			coverView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: edgeMargin),
			coverView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -edgeMargin)
		])
		
		// content-view to fill it
		scrollView.addSubview(contentView)
		NSLayoutConstraint.activate([
			contentView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: edgeMargin),
			contentView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -edgeMargin),
			contentView.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: 10),
			contentView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
			// we want vertical scrolling, so we want our content to be only as wide as
			// the scroll view's Frame Layout Guide
			contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -edgeMargin*2),
		])
		
		// !IMPORTANT: to correct calculate contentView HEIGHT
		// it neads to set heightAnchor or relate buttomAnchor to bottom element in constraints, i.e.:
		// 'contentView.bottomAnchor.constraint(greaterThanOrEqualTo: <bottomView>.bottomAnchor).isActive = true'
	}
	
	//
	public lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	//
	public lazy var contentView: UIView = {
		let contentView = UIView()
		contentView.translatesAutoresizingMaskIntoConstraints = false
		return contentView
	}()
	
	//
	public lazy var coverView: DetailCoverView = {
		let coverView = DetailCoverView()
		coverView.translatesAutoresizingMaskIntoConstraints = false
		return coverView
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
}
