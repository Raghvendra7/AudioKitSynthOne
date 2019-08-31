//
//  FlatToggleButtonStyleKit.swift
//  AudioKitSynth
//
//  Created by Matthew Fecher on 1/7/19.
//  Copyright © 2019 AudioKit. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class FlatToggleButtonStyleKit : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawRoundButton(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 43), resizing: ResizingBehavior = .aspectFit, isToggled: Bool = false) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 43), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 43)
        let resizedShadowScale: CGFloat = min(resizedFrame.width / 40, resizedFrame.height / 43)


        //// Color Declarations
        let orange = UIColor(red: 0.902, green: 0.533, blue: 0.008, alpha: 1.000)
        let colorOn = UIColor(red: 0.216, green: 0.216, blue: 0.216, alpha: 1.000)
        let shadow2Color2 = UIColor(red: 0.255, green: 0.255, blue: 0.275, alpha: 1.000)

        //// Shadow Declarations
        let shadow = NSShadow()
        shadow.shadowColor = orange.withAlphaComponent(0.75 * orange.cgColor.alpha)
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        shadow.shadowBlurRadius = 10
        let shadow2 = NSShadow()
        shadow2.shadowColor = shadow2Color2
        shadow2.shadowOffset = CGSize(width: 5, height: 12)
        shadow2.shadowBlurRadius = 14

        //// Button
        //// buttonOff
        //// Rectangle 2 Drawing


        //// buttonBackground Drawing
        let buttonBackgroundPath = UIBezierPath(ovalIn: CGRect(x: 2.5, y: 1.5, width: 30, height: 30))
        colorOn.setFill()
        buttonBackgroundPath.fill()


        if (isToggled) {
            //// buttonBackground 2 Drawing
            let buttonBackground2Path = UIBezierPath(ovalIn: CGRect(x: 2.5, y: 1.5, width: 30, height: 30))
            colorOn.setFill()
            buttonBackground2Path.fill()

            ////// buttonBackground 2 Inner Shadow
            context.saveGState()
            context.clip(to: buttonBackground2Path.bounds)
            context.setShadow(offset: CGSize.zero, blur: 0)
            context.setAlpha((shadow2.shadowColor as! UIColor).cgColor.alpha)
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            let buttonBackground2OpaqueShadow = (shadow2.shadowColor as! UIColor).withAlphaComponent(1)
            context.setShadow(offset: CGSize(width: shadow2.shadowOffset.width * resizedShadowScale, height: shadow2.shadowOffset.height * resizedShadowScale), blur: shadow2.shadowBlurRadius * resizedShadowScale, color: buttonBackground2OpaqueShadow.cgColor)
            context.setBlendMode(.sourceOut)
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            buttonBackground2OpaqueShadow.setFill()
            buttonBackground2Path.fill()

            context.endTransparencyLayer()
            context.endTransparencyLayer()
            context.restoreGState()

        }




        if (isToggled) {
            //// buttonOn
            //// Rectangle Drawing
            let rectanglePath = UIBezierPath(rect: CGRect(x: 15.5, y: 10.5, width: 4, height: 12))
            context.saveGState()
            context.setShadow(offset: CGSize(width: shadow.shadowOffset.width * resizedShadowScale, height: shadow.shadowOffset.height * resizedShadowScale), blur: shadow.shadowBlurRadius * resizedShadowScale, color: (shadow.shadowColor as! UIColor).cgColor)
            orange.setFill()
            rectanglePath.fill()
            context.restoreGState()



        }
        
        context.restoreGState()

    }




    @objc(FlatToggleButtonStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
