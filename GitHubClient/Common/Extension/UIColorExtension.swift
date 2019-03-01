//
//  UIColorExtension.swift
//  Rhizome
//
//  Created by ichi on 2015/07/28.
//  Copyright © 2017年 Rhzome Inc. All rights reserved.
//
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
    convenience init(decimal: Int, alpha: CGFloat) {
        self.init(red: ((decimal & 0xFF0000) >> 16), green: ((decimal & 0x00FF00) >> 8), blue: ((decimal & 0x0000FF) >> 0), alpha: alpha)
    }
    
    convenience init(decimal: Int) {
        self.init(decimal: decimal, alpha: 1.0)
    }
    
    class func rgb(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    public func hexValue(_ includeAlpha: Bool) -> UInt {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var hexString: String!
        
        if includeAlpha {
            hexString = String(format: "%02X%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255), Int(alpha * 255))
        } else {
            hexString = String(format: "%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
        }
        
        return UInt(hexString, radix: 16)!
        
    }
    
}

extension CAGradientLayer {

    class func gradientLayer(frame: CGRect, topColor: UIColor, bottomColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        return gradientLayer
    }
    
}
