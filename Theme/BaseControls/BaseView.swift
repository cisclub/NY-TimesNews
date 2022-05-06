//
//  BaseView.swift
//  EtisalatUI
//
//  Created by Asad Ali on 28/04/2022.
//

import UIKit

enum BaseViewType {
    case card
    case container
    case custom
}

class BaseView: UIView {
    
    public var type: BaseViewType = .custom { didSet {
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
        
        switch type {
        case .card:
            backgroundColor = ApplicationTheme.colors.defaultBackground
            roundCorners(corners: [.topLeft, .topRight], radius: 20)
        case .container:
            backgroundColor = ApplicationTheme.colors.lightGrey
            roundCorners(withRadius: 16)
        case .custom:
            backgroundColor = ApplicationTheme.colors.green
            //roundCorners(withRadius: 4)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        //Disable this if you are adding constraints manually
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        //Add custom constraint code here
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
