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
    case h4
    case h4Active
    case h6
    case subtitle
    case subtitleActive
    case custom
}

class BaseLabel: UILabel {
    
    public var type: BaseLabelType = .custom { didSet {
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
        case .h4:
            attributedText = text?.styled(as: .h4)
        case .h4Active:
            attributedText = text?.styled(as: .h4Active)
        case .h6:
            attributedText = text?.styled(as: .h6)
        case .subtitle:
            attributedText = text?.styled(as: .body2)
        case .subtitleActive:
            attributedText = text?.styled(as: .body2Active)
        case .custom:
            attributedText = text?.styled(as: .body1)
        }
    }
    
    func fullyRoundCorners() {
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }
}
