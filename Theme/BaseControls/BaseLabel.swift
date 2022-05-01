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
    case subtitle
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
        case .subtitle:
            attributedText = text?.styled(as: .body2)
        case .custom:
            attributedText = text?.styled(as: .body1)
        }
    }
}
