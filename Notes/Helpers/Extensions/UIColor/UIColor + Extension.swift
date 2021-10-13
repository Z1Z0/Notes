//
//  UIColor + Extension.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 02/10/2021.
//

import Foundation
import UIKit

extension UIColor {
    
    static var customLightGray: UIColor {
        return UIColor(red: 251/255, green: 250/255, blue: 255/255, alpha: 1.0)
    }
    
    static var customMediumGray: UIColor {
        return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
    }
    
    static var customLightCyan: UIColor {
        return UIColor(red: 147/255, green: 191/255, blue: 254/255, alpha: 1.0)
    }
    
    static var customDarkGray: UIColor {
        return UIColor(red: 82/255, green: 82/255, blue: 82/255, alpha: 1.0)
    }
    
    static var customBlueGreen: UIColor {
        return UIColor(red: 48/255, green: 194/255, blue: 207/255, alpha: 1.0)
    }
    
    static var customLightOrange: UIColor {
        return UIColor(red: 252/255, green: 180/255, blue: 96/255, alpha: 1.0)
    }
    
    static var customPurple: UIColor {
        return UIColor(red: 236/255, green: 167/255, blue: 248/255, alpha: 1.0)
    }
    
    static var customWatermelon: UIColor {
        return UIColor(red: 248/255, green: 166/255, blue: 174/255, alpha: 1.0)
    }

    static var customGreen: UIColor {
        return UIColor(red: 30/255, green: 225/255, blue: 150/255, alpha: 1.0)
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.removeFirst() }
        
        if cString.count != 6 {
            self.init("ff0000") // return red color for wrong hex input
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
}
