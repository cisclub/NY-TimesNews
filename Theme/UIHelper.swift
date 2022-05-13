//
//  UIHelper.swift
//  EtisalatUI
//
//  Created by Asad Ali on 25/04/2022.
//

import UIKit

public class UIHelper {
    
    class func roundedCorners(withRadius radius: CGFloat) {
        
    }
}


public extension UIView {
    
    func roundCorners(withBorder border: CGFloat = 2.0, borderColor color: UIColor, withRadius radius: CGFloat) {
        
        layer.cornerRadius = radius
        layer.borderColor = color.cgColor
        layer.borderWidth = border
        layer.masksToBounds  = true
    }
    
    func addBorder(withColor color: UIColor, borderWidth width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func roundCorners(withRadius radius: CGFloat) {
        
        layer.cornerRadius = radius
        layer.masksToBounds  = true
    }
}
