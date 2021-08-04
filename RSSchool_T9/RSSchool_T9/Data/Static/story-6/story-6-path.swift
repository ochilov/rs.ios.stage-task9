//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: JohnO
// On: 04.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

extension CGPath {
	// 1
	static let story6path1: CGPath = {
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 63.45, y: 0))
		path.addCurve(to: CGPoint(x: 40.18, y: 23.44), controlPoint1: CGPoint(x: 63.45, y: 12.92), controlPoint2: CGPoint(x: 53.01, y: 23.44))
		path.addLine(to: CGPoint(x: 16.91, y: 23.44))
		path.addCurve(to: CGPoint(x: 5.27, y: 35.16), controlPoint1: CGPoint(x: 10.49, y: 23.44), controlPoint2: CGPoint(x: 5.27, y: 28.69))
		path.addCurve(to: CGPoint(x: 16.91, y: 46.88), controlPoint1: CGPoint(x: 5.27, y: 41.62), controlPoint2: CGPoint(x: 10.49, y: 46.88))
		path.addLine(to: CGPoint(x: 23.22, y: 46.88))
		path.addCurve(to: CGPoint(x: 31.45, y: 52.73), controlPoint1: CGPoint(x: 24.43, y: 50.28), controlPoint2: CGPoint(x: 27.66, y: 52.73))
		path.addCurve(to: CGPoint(x: 40.18, y: 43.95), controlPoint1: CGPoint(x: 36.26, y: 52.73), controlPoint2: CGPoint(x: 40.18, y: 48.79))
		path.addCurve(to: CGPoint(x: 31.45, y: 35.16), controlPoint1: CGPoint(x: 40.18, y: 39.1), controlPoint2: CGPoint(x: 36.26, y: 35.16))
		path.addCurve(to: CGPoint(x: 23.22, y: 41.02), controlPoint1: CGPoint(x: 27.66, y: 35.16), controlPoint2: CGPoint(x: 24.43, y: 37.61))
		path.addLine(to: CGPoint(x: 16.91, y: 41.02))
		path.addCurve(to: CGPoint(x: 11.09, y: 35.16), controlPoint1: CGPoint(x: 13.7, y: 41.02), controlPoint2: CGPoint(x: 11.09, y: 38.39))
		path.addCurve(to: CGPoint(x: 16.91, y: 29.3), controlPoint1: CGPoint(x: 11.09, y: 31.93), controlPoint2: CGPoint(x: 13.7, y: 29.3))
		path.addLine(to: CGPoint(x: 40.18, y: 29.3))
		path.addCurve(to: CGPoint(x: 63.45, y: 52.73), controlPoint1: CGPoint(x: 53.01, y: 29.3), controlPoint2: CGPoint(x: 63.45, y: 39.81))
		path.addLine(to: CGPoint(x: 69.27, y: 52.73))
		path.addLine(to: CGPoint(x: 69.27, y: 0))
		path.addLine(to: CGPoint(x: 63.45, y: 0))
		path.close()
		path.move(to: CGPoint(x: 31.45, y: 41.02))
		path.addCurve(to: CGPoint(x: 34.36, y: 43.95), controlPoint1: CGPoint(x: 33.06, y: 41.02), controlPoint2: CGPoint(x: 34.36, y: 42.33))
		path.addCurve(to: CGPoint(x: 31.45, y: 46.88), controlPoint1: CGPoint(x: 34.36, y: 45.56), controlPoint2: CGPoint(x: 33.06, y: 46.88))
		path.addCurve(to: CGPoint(x: 28.54, y: 43.95), controlPoint1: CGPoint(x: 29.85, y: 46.88), controlPoint2: CGPoint(x: 28.54, y: 45.56))
		path.addCurve(to: CGPoint(x: 31.45, y: 41.02), controlPoint1: CGPoint(x: 28.54, y: 42.33), controlPoint2: CGPoint(x: 29.85, y: 41.02))
		path.close()
		path.move(to: CGPoint(x: 63.45, y: 35.17))
		path.addCurve(to: CGPoint(x: 52.85, y: 26.37), controlPoint1: CGPoint(x: 60.68, y: 31.45), controlPoint2: CGPoint(x: 57.05, y: 28.42))
		path.addCurve(to: CGPoint(x: 63.45, y: 17.56), controlPoint1: CGPoint(x: 57.05, y: 24.32), controlPoint2: CGPoint(x: 60.68, y: 21.28))
		path.addLine(to: CGPoint(x: 63.45, y: 35.17))
		path.close()

		path.append({
			let path = UIBezierPath()
			path.move(to: CGPoint(x: 11.09, y: 69.14))
			path.addLine(to: CGPoint(x: 5.27, y: 69.14))
			path.addLine(to: CGPoint(x: 5.27, y: 75))
			path.addLine(to: CGPoint(x: 63.45, y: 75))
			path.addLine(to: CGPoint(x: 63.45, y: 69.14))
			path.addLine(to: CGPoint(x: 57.63, y: 69.14))
			path.addLine(to: CGPoint(x: 57.63, y: 64.45))
			path.addLine(to: CGPoint(x: 63.45, y: 64.45))
			path.addLine(to: CGPoint(x: 63.45, y: 58.59))
			path.addLine(to: CGPoint(x: 57.63, y: 58.59))
			path.addLine(to: CGPoint(x: 57.63, y: 52.73))
			path.addLine(to: CGPoint(x: 31.45, y: 52.73))
			path.addLine(to: CGPoint(x: 11.09, y: 52.73))
			path.addLine(to: CGPoint(x: 11.09, y: 69.14))
			path.close()
			path.move(to: CGPoint(x: 51.82, y: 58.59))
			path.addLine(to: CGPoint(x: 51.82, y: 69.14))
			path.addLine(to: CGPoint(x: 16.91, y: 69.14))
			path.addLine(to: CGPoint(x: 16.91, y: 58.59))
			path.addLine(to: CGPoint(x: 51.82, y: 58.59))
			path.close()
			return path
		}())
		return path.cgPath
	}()
	
	// 2
	static let story6path2: CGPath = {
		let path = UIBezierPath(ovalIn: .init(x: 2, y: 2, width: 70, height: 70))
		
		path.append( UIBezierPath(ovalIn: .init(x: 34, y: 34, width: 7, height: 7)) )
		path.append( UIBezierPath(ovalIn: .init(x: 27, y: 27, width: 21, height: 21)) )
		path.append( UIBezierPath(arcCenter: .init(x: 37.5, y: 37.5), radius: 23, startAngle: -3.14, endAngle: -0.5, clockwise: true) )
		path.append( UIBezierPath(arcCenter: .init(x: 37.5, y: 37.5), radius: 23, startAngle: 0, endAngle: 0.5, clockwise: true) )
		path.append( UIBezierPath(arcCenter: .init(x: 37.5, y: 37.5), radius: 23, startAngle: 1.0, endAngle: 2.3, clockwise: true) )
		
		return path.cgPath
	}()
		
}
