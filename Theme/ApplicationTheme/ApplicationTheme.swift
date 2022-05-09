//
//  ApplicationTheme.swift
//  EtisalatUI
//
//  Created by Asad Ali on 28/04/2022.
//

import UIKit

extension UIFont {
    
    class var h1: UIFont {
        return UIFont(name: "Lato-Medium", size: 32.0)!
    }
    
    class var h2: UIFont {
        return UIFont(name: "Lato-Medium", size: 24.0)!
    }
    
    class var h3: UIFont {
        return UIFont(name: "Lato-Heavy", size: 20.0)!
    }
    
    class var h4: UIFont {
        return UIFont(name: "Lato-Heavy", size: 16.0)!
    }
    
    class var body1: UIFont {
        return UIFont(name: "Lato-Medium", size: 16.0)!
    }
    
    class var h5: UIFont {
        return UIFont(name: "Lato-Heavy", size: 14.0)!
    }
    
    class var body2: UIFont {
        return UIFont(name: "Lato-Medium", size: 14.0)!
    }
}


struct Spacing {
    
    static let XS: CGFloat = 8.0
    static let M: CGFloat = 16.0
    static let L: CGFloat = 28.0
    static let XL: CGFloat = 32.0
    static let XXL: CGFloat = 40.0
}


enum TextStyle {
    
    case h1
    case h2
    case h3
    case h4
    case h5
    case body1
    case body2
}

extension TextStyle {
    
    var attributes: [NSAttributedString.Key: Any] {
        switch self {
        case .h1:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.XL
            return [.font: UIFont.h1,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .h2:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.L
            return [.font: UIFont.h2,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .h3:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.L
            return [.font: UIFont.h3,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .h4:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h4,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .body1:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.body1,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .h5:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h5,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
            
        case .body2:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.body2,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.darkText]
        }
    }
}

extension String {
    
    func styled(as style: TextStyle) -> NSAttributedString {
        
        return NSAttributedString(string: self, attributes: style.attributes)
    }
}

//label.attributedText = NSAttributedString(string: "Hello world", attributes: TextStyle.title.attributes)


extension UIColor {
    
    class var blue1: UIColor {
        return UIColor(red: 68/255.0, green: 104/255.0, blue: 234/255.0, alpha: 1)
    }
    
    class var blue2: UIColor {
        return UIColor(red: 0/255.0, green: 36/255.0, blue: 166/255.0, alpha: 1)
    }
    
    class var darkText: UIColor {
        return UIColor(red: 53/255.0, green: 55/255.0, blue: 56/255.0, alpha: 1)
    }
    
    class var disabledBackground: UIColor {
        return #colorLiteral(red: 0.8196078431, green: 0.8235294118, blue: 0.8196078431, alpha: 1)
    }
    
    class var disabledTextColor: UIColor {
        return #colorLiteral(red: 0.5176470588, green: 0.5294117647, blue: 0.537254902, alpha: 1)
    }
    
    class var separatorColor: UIColor {
        return #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
    }
    
    class var mainThemeColor: UIColor {
        return #colorLiteral(red: 0.4431372549, green: 0.6196078431, blue: 0.09803921569, alpha: 1)
    }
    
    class var shimmerColor: UIColor {
        return UIColor(red: 245/255.0, green: 246/255.0, blue: 243/255.0, alpha: 1.0)
    }
}

//view.backgroundColor = UIColor.MyProject.pink

public struct ApplicationTheme {
    
    struct colors {
        
        static let defaultBackground = UIColor(red: 245/255.0, green: 246/255.0, blue: 243/255.0, alpha: 1)
        static let lightGrey = UIColor.lightGray
        static let green = UIColor(red: 113/255.0, green: 158/255.0, blue: 25/255.0, alpha: 1)
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


// Navigation Bar
extension ApplicationTheme {
    static func setupNavigationBarTheme() {
        // UInavigationbar in contracted state
        let navigationTitleAttributes = [NSAttributedString.Key.font: UIFont.h2,
                                         NSAttributedString.Key.foregroundColor: UIColor.darkText]
        // UInavigationbar in expanded state
        let navigationLargeTitleAttributes = [NSAttributedString.Key.font: UIFont.h1,
                                              NSAttributedString.Key.foregroundColor: UIColor.darkText]
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = navigationTitleAttributes
        appearance.largeTitleTextAttributes = navigationLargeTitleAttributes
        appearance.shadowColor = nil // to remove seperator
        UINavigationBar.appearance().tintColor = .white // text/button color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        if #available(iOS 13.0, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().barTintColor = .white // background color
            UINavigationBar.appearance().isTranslucent = false
        }
    }
}
