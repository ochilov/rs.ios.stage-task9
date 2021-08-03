//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 03.08.2021
//
// tutorial:
// https://www.youtube.com/watch?v=YpVZgQW1TvQ
//
// Copyright © 2021 JohnO. All rights reserved.

import UIKit


class ImageScrollView: UIScrollView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.delegate = self
		self.showsVerticalScrollIndicator = false
		self.showsHorizontalScrollIndicator = false
		self.decelerationRate = .fast
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		if !sizeToZoomScale.equalTo(self.bounds.size) {
			self.setZoomScaleTo(min: scaleMin, max: scaleMax)
			self.resetZoom()
		}
		self.centerImage()
	}
	
	private var imageZoomView: UIImageView!
	public func set(image: UIImage) {
		imageZoomView?.removeFromSuperview()
		imageZoomView = nil
		
		imageZoomView = UIImageView(image: image)
		addSubview(imageZoomView)
		
		configurateViewFor(imageSize: image.size)
	}
	
	private func configurateViewFor(imageSize: CGSize) {
		self.contentSize = imageSize
		self.setZoomScaleTo(min: 1, max: 3)
		self.resetZoom()
		self.imageZoomView.addGestureRecognizer(zoomingTap)
		self.imageZoomView.isUserInteractionEnabled = true
	}
	
	// zoom
	private var sizeToZoomScale: CGSize = .zero
	private var scaleMin: CGFloat = 0.0
	private var scaleMax: CGFloat = 0.0
	public func setZoomScaleTo(min scaleMin: CGFloat, max scaleMax: CGFloat) {
		self.scaleMin = scaleMin
		self.scaleMax = scaleMax
		if (imageZoomView == nil) {
			return
		}
		let boundSize = self.bounds.size
		let imageSize = self.imageZoomView.bounds.size
		
		let scaleX = boundSize.width / imageSize.width
		let scaleY = boundSize.height / imageSize.height
		let scale = min(scaleX, scaleY)
		
		self.minimumZoomScale = scale * scaleMin
		self.maximumZoomScale = scale * scaleMax
		
		if self.zoomScale < self.minimumZoomScale {
			self.zoomScale = self.minimumZoomScale
		}
		else if self.zoomScale > self.maximumZoomScale {
			self.zoomScale = self.maximumZoomScale
		}
		sizeToZoomScale = boundSize
	}
	
	public func resetZoom() {
		self.zoomScale = self.minimumZoomScale
		self.centerImage()
	}
	
	// position
	public func centerImage() {
		if (imageZoomView == nil) {
			return
		}
		let boundSize = self.bounds.size
		var frameToCenter = self.imageZoomView.frame
		
		frameToCenter.origin.x = (frameToCenter.size.width < boundSize.width)
							   ? (boundSize.width - frameToCenter.size.width) / 2
							   : 0
		frameToCenter.origin.y = (frameToCenter.size.height < boundSize.height)
							   ? (boundSize.height - frameToCenter.size.height) / 2
							   : 0
		
		self.imageZoomView.frame = frameToCenter
	}
	
	// zoom by doubletap
	private lazy var zoomingTap: UITapGestureRecognizer = {
		let zoomingTap = UITapGestureRecognizer(target: self, action: #selector(handleZoomingTap(sender:)))
		zoomingTap.numberOfTapsRequired = 2
		return zoomingTap
	}()
	
	@objc private func handleZoomingTap(sender: UITapGestureRecognizer) {
		let location = sender.location(in: sender.view)
		self.zoom(at: location, animated: true)
	}
	
	private func zoom(at point: CGPoint, animated: Bool) {
		let curScale = self.zoomScale
		let minScale = self.minimumZoomScale
		let maxScale = self.maximumZoomScale
		
		if (minScale == maxScale && minScale > 1) {
			return
		}
		
		let newScale = (curScale == minScale) ? maxScale : minScale
		
		var zoomRect = self.bounds
		zoomRect.size.width /= newScale
		zoomRect.size.height /= newScale
		zoomRect.origin.x = point.x - zoomRect.size.width/2
		zoomRect.origin.y = point.y - zoomRect.size.height/2
		
		zoom(to: zoomRect, animated: animated)
	}
}

// MARK: - UIScrollViewDelegate
extension ImageScrollView: UIScrollViewDelegate {
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageZoomView
	}
	
	func scrollViewDidZoom(_ scrollView: UIScrollView) {
		self.centerImage()
	}
}
