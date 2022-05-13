//
//  BaseLabel.swift
//  EtisalatUI
//
//  Created by Asad Ali on 28/04/2022.
//

import UIKit

enum BaseLabelType {
    case title
    case h1
    case h2
    case h3
    case h4
    case h4Active
    case h5
    case h6
    case subtitle
    case subtitleActive
    case custom(color: UIColor, alignment: NSTextAlignment, font: UIFont)
}

class BaseLabel: UILabel {
    
    public var type: BaseLabelType = .subtitle { didSet {
        setup()
    }}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override var text: String? { didSet {
        super.text = text
        setup()
    }}
    
    func setup() {
        
        switch type {
        case .title:
            attributedText = text?.styled(as: .h1)
        case .h1:
            attributedText = text?.styled(as: .h1)
        case .h2:
            attributedText = text?.styled(as: .h2)
        case .h3:
            attributedText = text?.styled(as: .h3)
        case .h4:
            attributedText = text?.styled(as: .h4)
        case .h4Active:
            attributedText = text?.styled(as: .h4Active)
        case .h5:
            attributedText = text?.styled(as: .h5)
        case .h6:
            attributedText = text?.styled(as: .h6)
        case .subtitle:
            attributedText = text?.styled(as: .body2)
        case .subtitleActive:
                   attributedText = text?.styled(as: .body2Active)
        case let .custom(color, alignment, font):
            attributedText = text?.styled(as: .custom(color: color, alignment: alignment, font: font))
        }
    }
}
