//
//  TabbarItem.swift
//  MoViews
//
//  Created by Faza Azizi on 15/09/22.
//

import Foundation
import UIKit

class TabbarItem: UITabBar {
    
    var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    func addShape() {
        let newShapeLayer = CAShapeLayer()
        
        newShapeLayer.path = defaultCustomTabbar()
        newShapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 15.0).cgPath
        
        newShapeLayer.fillColor = UIColor.white.cgColor
        
        newShapeLayer.shadowColor = UIColor.gray.cgColor
        newShapeLayer.shadowOffset = .zero
        newShapeLayer.shadowOpacity = 0.7
        newShapeLayer.shadowRadius = 8
        
        if let oldShapeLayer = shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: newShapeLayer)
        } else {
            self.layer.insertSublayer(newShapeLayer, at: 0)
        }
        
        shapeLayer = newShapeLayer
    }
    
    
    private func defaultCustomTabbar() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 0.0, height: 0.0))
        
        return path.cgPath
    }
    
    func defaultCurvedPath(output: (CGPath) -> Void) {
        let heightHole: CGFloat = 40
        let centerWidth = self.frame.width / 2
        let height = self.frame.height
        let width = self.frame.width
        let path = UIBezierPath()
        
        let aPoint    = CGPoint(x: 0, y: 24)
        let aCurveToB = CGPoint(x: 0, y: aPoint.y - 13)
        
        let bPoint    = CGPoint(x: 24, y: 0)
        let bCurveToA = CGPoint(x: bPoint.x - 13, y: 0)
        
        let cPoint    = CGPoint(x: centerWidth - 57, y: 0)
        let cCurveToD = CGPoint(x: cPoint.x + 9, y: 0)
        
        let dPoint    = CGPoint(x: centerWidth - 38, y: 13)
        let dCurveToC = CGPoint(x: dPoint.x - 3, y: 5.33)
        let dCurveToE = CGPoint(x: dPoint.x + 6, y: 28.86)
        
        let ePoint    = CGPoint(x: centerWidth, y: heightHole)
        let eCurveToD = CGPoint(x: ePoint.x - 14, y: 40)
        let eCurveToF = CGPoint(x: ePoint.x + 14, y: 40)
        
        let fPoint    = CGPoint(x: centerWidth + 38, y: 13)
        let fCurveToE = CGPoint(x: fPoint.x - 6, y: 28.86)
        let fCurveToG = CGPoint(x: fPoint.x + 3, y: 5.33)
        
        let gPoint    = CGPoint(x: centerWidth + 57, y: 0)
        let gCurveToF = CGPoint(x: gPoint.x - 9, y: 0)
        
        let hPoint    = CGPoint(x: width - 24, y: 0)
        let hCurveToI = CGPoint(x: hPoint.x + 13, y: 0)
        
        let iPoint    = CGPoint(x: width, y: 24)
        let iCurveToH = CGPoint(x: width, y: iPoint.y - 13)
        
        let jPoint    = CGPoint(x: width, y: height)
        
        // start
        path.move(to: CGPoint(x: 0, y: height))
        
        // A
        path.addLine(to: aPoint)
        
        // A to B
        path.addCurve(to: bPoint, controlPoint1: aCurveToB, controlPoint2: bCurveToA)
        
        // B to C
        path.addLine(to: cPoint)
        
        // C to D with curve
        path.addCurve(to: dPoint, controlPoint1: cCurveToD, controlPoint2: dCurveToC)
        
        // D to E with curve
        path.addCurve(to: ePoint, controlPoint1: dCurveToE, controlPoint2: eCurveToD)
        
        // E to F with curve
        path.addCurve(to: fPoint, controlPoint1: eCurveToF, controlPoint2: fCurveToE)
        
        // F to G with curve
        path.addCurve(to: gPoint, controlPoint1: fCurveToG, controlPoint2: gCurveToF)
        
        // G to H
        path.addLine(to: hPoint)
        
        // H to I with curve
        path.addCurve(to: iPoint, controlPoint1: hCurveToI, controlPoint2: iCurveToH)
        
        // I to J
        path.addLine(to: jPoint)
        
        // close the line
        path.close()
        
        output(path.cgPath)
    }
    
    func alternativeCurvedPath(output: (CGPath) -> Void) {
        let heightCurve: CGFloat = 35
        let doubleHeightCurve = heightCurve * 2
        let centerWidth = self.frame.width / 2
        let height = self.frame.height
        let width = self.frame.width
        let path = UIBezierPath()
        
        // leftmost bottom corner
        path.move(to: CGPoint(
            x: 0,
            y: height))
        
        // leftmost bottom corner to leftmost curve
        path.addLine(to: CGPoint(
            x: 0,
            y: 24))
        
        // leftmost curve to top
        path.addCurve(to: CGPoint(
            x: 24,
            y: 0),
                      controlPoint1: CGPoint(
                        x: 0,
                        y: 24 - 13),
                      controlPoint2: CGPoint(
                        x: 24 - 13,
                        y: 0))
        
        // leftmost top corner to left curve point
        path.addLine(to: CGPoint(
            x: centerWidth - doubleHeightCurve,
            y: 0))
        
        // curve down
        path.addCurve(
            to: CGPoint(
                x: centerWidth,
                y: heightCurve),
            controlPoint1: CGPoint(
                x: centerWidth - 30,
                y: 0),
            controlPoint2: CGPoint(
                x: centerWidth - 35,
                y: heightCurve))
        
        // curve up
        path.addCurve(
            to: CGPoint(
                x: centerWidth + doubleHeightCurve,
                y: 0),
            controlPoint1: CGPoint(
                x: centerWidth + 35,
                y: heightCurve),
            controlPoint2: CGPoint(
                x: centerWidth + 30,
                y: 0))
        
        // right curve point to right curve (down)
        path.addLine(to: CGPoint(
            x: width - 30,
            y: 0))
        
        // curve down
        path.addCurve(to: CGPoint(
            x: width,
            y: 24),
                      controlPoint1: CGPoint(
                        x: width - 24 + 13,
                        y: 0),
                      controlPoint2: CGPoint(
                        x: width,
                        y: 24 - 13))
        
        // rightmost to bottom rightmost
        path.addLine(to: CGPoint(
            x: width,
            y: height))
        
        // close the line
        path.close()
        
        output(path.cgPath)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}

