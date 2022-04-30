//
//  SWThemeManager.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 04/11/2021.
//  Copyright © 2021 Etisalat. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit


class SWThemeManager {
    class func themeCornerRadius() -> CGFloat {
        return 8.0
    }
    
    class func themeGreenColor(alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: 113.0/255.0,
                       green: 158.0/255.0,
                       blue: 25.0/255.0,
                       alpha: alpha)
    }
    
    class func themeGrayColor() -> UIColor {
        return UIColor(red: 111.0 / 255.0,
                       green: 114.0 / 255.0,
                       blue: 115.0 / 255.0,
                       alpha: 1.0)
    }
    
    class func themeTextPlaceholderColor() -> UIColor {
        return UIColor(red: 53.0/255.0,
                       green: 55.0/255.0,
                       blue: 56.0/255.0,
                       alpha: 1.0)
    }
    
    class func themeGrayShadowColor() -> UIColor {
        return UIColor(red: 132.0 / 255.0,
                       green: 135.0 / 255.0,
                       blue: 137.0 / 255.0,
                       alpha: 1.0)
    }
    
    class func themeDisabledGrayColor() -> UIColor {
        return UIColor(red: 209/255.0,
                       green:209/255.0,
                       blue:209/255.0,
                       alpha:1.0)
    }
    
    class func themeGreenShadowColor() -> UIColor {
        return SWThemeManager.themeGreenColor(alpha: 0.5)
    }
    
    class func themeErrorRedColor() -> UIColor {
        return UIColor(red: 190 / 255.0,
                       green:18 / 255.0,
                       blue: 24 / 255.0,
                       alpha: 1.0)
    }
    
    class func themeBlackTextColor() -> UIColor {
        return UIColor(red: 21.0/255.0,
                       green:21.0/255.0,
                       blue:21.0/255.0,
                       alpha:1.0)
    }
    
    class func themeBlackSecondaryTextColor() -> UIColor {
        return UIColor(red:107/255,
                       green:107/255,
                       blue:107/255,
                       alpha: 1)
    }
    
    class func themeSemiTransparantBlackColor() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    }
    
    class func setThemeShadowForView(_ view: UIView,
                                     color: UIColor = SWThemeManager.themeGreenShadowColor(),
                                     y: CGFloat = 5.0,
                                     radius: CGFloat = 4.0)
    {
        view.layer.shadowOffset = CGSize(width: 0, height: y)
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = radius
    }
}
