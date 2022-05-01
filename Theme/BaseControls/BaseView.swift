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
            roundCorners(withRadius: 12)
        case .container:
            backgroundColor = ApplicationTheme.colors.lightGrey
            roundCorners(withRadius: 16)
        case .custom:
            backgroundColor = ApplicationTheme.colors.green
            roundCorners(withRadius: 4)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Custom manually positioning layout goes here
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        //Disable this if you are adding constraints manually
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        //Add custom constraint code here
    }
}
