//
//  UIFont + Extension.swift
//  Notes
//
//  Created by Ahmed Abd Elaziz on 02/10/2021.
//

import Foundation
import UIKit

extension UIFont {
    
    class func toucheLight(size ofSize: CGFloat) -> UIFont {
        return UIFont(name: "ToucheW03-Light", size: ofSize)!
    }
    
    class func toucheRegular(size ofSize: CGFloat) -> UIFont {
        return UIFont(name: "ToucheW03-Regular", size: ofSize)!
    }
    
    class func toucheMedium(size ofSize: CGFloat) -> UIFont {
        return UIFont(name: "ToucheW03-Medium", size: ofSize)!
    }
    
    class func toucheSemiBold(size ofSize: CGFloat) -> UIFont {
        return UIFont(name: "ToucheW03-Semibold", size: ofSize)!
    }
    
    class func toucheBold(size ofSize: CGFloat) -> UIFont {
        return UIFont(name: "ToucheW03-Bold", size: ofSize)!
    }
    
}
