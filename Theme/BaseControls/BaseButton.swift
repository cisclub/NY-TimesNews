//
//  BaseButton.swift
//  EtisalatUI
//
//  Created by Asad Ali on 28/04/2022.
//

import UIKit

public enum BaseButtonType: Equatable {
    case greenBordered
    case whiteBackground
    case simple
    case blackBordered
    case icon
    case disabled
    case custom(textColor: UIColor, bgColor: UIColor, cornerRadius: CGFloat, borderColor: UIColor?, margin: CGFloat)
}


class BaseButton: UIButton {
    
    private var padding: CGFloat = 0.0 { didSet {
        invalidateIntrinsicContentSize()
    }}
    
    public var tapHandler: ((_ sender: BaseButton)->Void)? { didSet {
        addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
    }}
    
    public var type: BaseButtonType = .simple { didSet {
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
    
    func setup() {
        
        titleLabel?.font = UIFont.h5
        
        switch type {
        case .greenBordered:
            backgroundColor = UIColor.clear
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            roundCorners(borderColor: ApplicationTheme.colors.green, withRadius: frame.size.height / 2)
            
        case .whiteBackground:
            backgroundColor = UIColor.white
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            roundCorners(withRadius: 20.0)
            
        case .simple:
            backgroundColor = UIColor.clear
            setTitleColor(ApplicationTheme.colors.green, for: .normal)
            
        case .blackBordered:
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.darkText, for: .normal)
            roundCorners(borderColor: UIColor.darkText, withRadius: 20.0)
            
        case .icon:
            backgroundColor = UIColor.clear
            setTitleColor(UIColor.clear, for: .normal)
            padding = 0.0
            
        case .disabled:
            backgroundColor = UIColor.disabledBackground
            setTitleColor(UIColor.disabledTextColor, for: .normal)
            roundCorners(withRadius: frame.size.height / 2)
            
        case let .custom(textColor, bgColor, cornerRadius, borderColor, margin):
            backgroundColor = bgColor
            setTitleColor(textColor, for: .normal)
            padding = margin
            if let color = borderColor { addBorder(withColor: color, borderWidth: 2.0) }
            if cornerRadius > 0 { roundCorners(withRadius: cornerRadius) }
            break
        }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            guard padding > 0 else { return super.intrinsicContentSize }
            
            let size = super.intrinsicContentSize
            return CGSize(width: size.width+padding*2, height: size.height+padding)
        }
    }
    
    @objc private func handleTap(_ sender: Any) {
        
        tapHandler?(self)
    }
}
