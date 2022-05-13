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
        return UIFont(name: "NeoTech-Medium", size: 24.0)!
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
    
    class var h6: UIFont {
        return UIFont(name: "Lato-Heavy", size: 12.0)!
    }
    
    class var body2: UIFont {
        return UIFont(name: "Lato-Medium", size: 14.0)!
    }
    
    class var smallRegular: UIFont {
        return UIFont(name: "Lato-Regular", size: 12.0)!
    }
    
    class var regular: UIFont {
        return UIFont(name: "Lato-Regular", size: 14.0)!
    }
    
}


struct Spacing {
    
    static let XS: CGFloat = 8.0
    static let M: CGFloat = 16.0
    static let MM: CGFloat = 22.0
    static let L: CGFloat = 28.0
    static let XL: CGFloat = 32.0
    static let XXL: CGFloat = 40.0
}


enum TextStyle {
    
    case h1
    case h2
    case h3
    case h4
    case h4Active
    case h5
    case h6
    case body1
    case body2
    case body2Active
    case body3
    case regular
    case custom(color: UIColor, alignment: NSTextAlignment, font: UIFont)
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
                    .foregroundColor: UIColor.appDarkText]
            
        case .h2:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.L
            return [.font: UIFont.h2,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .h3:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.L
            return [.font: UIFont.h3,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .h4:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h4,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .h4Active:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h4,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.mainThemeColor]
            
        case .body1:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.body1,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .h5:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h5,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .h6:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.h6,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.white]
            
        case .body2:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.body2,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case .body2Active:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.body2,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.mainThemeColor]
            
        case .body3:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.MM
            return [.font: UIFont.body2,
                    .foregroundColor: UIColor.darkText]
            
        case .regular:
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: UIFont.regular,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: UIColor.appDarkText]
            
        case let .custom(color, alignment, font):
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = alignment
            paragraphStyle.minimumLineHeight = Spacing.M
            return [.font: font,
                    .paragraphStyle: paragraphStyle,
                    .foregroundColor: color]
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
    
    class var pink: UIColor {
        return UIColor(red: 255/255.0, green: 48/255.0, blue: 97/255.0, alpha: 1)
    }
    
    class var black: UIColor {
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
    }
    
    class var grey: UIColor {
        return UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)
    }
    
    class var appDarkText: UIColor {
        return UIColor(red: 53/255.0, green: 55/255.0, blue: 56/255.0, alpha: 1)
    }
    
    class var appActive: UIColor {
        return UIColor(red: 113/255.0, green: 158/255.0, blue: 25/255.0, alpha: 1)
    }
    
    class var appGray: UIColor {
        return UIColor(red: 111/255.0, green: 108/255.0, blue: 112/255.0, alpha: 1)
    }
    
    class var appLigtGray: UIColor {
        return UIColor(red: 178/255.0, green: 178/255.0, blue: 178/255.0, alpha: 1)
    }
    
    class var appRed: UIColor {
        return UIColor(red: 255/255.0, green: 98/255.0, blue: 94/255.0, alpha: 1)
    }
    
    class var appDisableButtonBg: UIColor {
        return UIColor(red: 209/255.0, green: 210/255.0, blue: 209/255.0, alpha: 1)
    }
    
    class var appDisableButtonText: UIColor {
        return UIColor(red: 132/255.0, green: 135/255.0, blue: 137/255.0, alpha: 1)
    }
    
    class var appSand: UIColor {
        return UIColor(red: 245/255.0, green: 246/255.0, blue: 243/255.0, alpha: 1)
    }
    
    class var separatorColor: UIColor {
        return UIColor(red: 231/255.0, green: 231/255.0, blue: 231/255.0, alpha: 1)
    }
    
    class var disabledBackground: UIColor {
            return #colorLiteral(red: 0.8196078431, green: 0.8235294118, blue: 0.8196078431, alpha: 1)
    }
    
    class var mainThemeColor: UIColor {
            return #colorLiteral(red: 0.4431372549, green: 0.6196078431, blue: 0.09803921569, alpha: 1)
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
