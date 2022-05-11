//
//  ActionsFadePresentingContainerStackView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//

import Foundation
import UIKit


class ActionsFadePresentingContainerStackView: UIStackView, MVVM {
    typealias ViewModelType = ActionsFadePresentingViewModel
    
    
    @IBOutlet private var titleLabel: BaseLabel!
    @IBOutlet private var titleContainerView: BaseView!
    @IBOutlet private var closeButton: BaseButton!
    @IBOutlet private var actionsViewContainer: UIView!
    
    
    var viewModel: ActionsFadePresentingViewModel?
    
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    private var _actionsView: UIView?
    private var actionsView: UIView {
        set {
            _actionsView = newValue
            
            addArrangedSubview(_actionsView!)
            let constH:NSLayoutConstraint = NSLayoutConstraint(item: _actionsView!,
                                                               attribute: NSLayoutConstraint.Attribute.height,
                                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                                               toItem: _actionsView,
                                                               attribute: NSLayoutConstraint.Attribute.height,
                                                               multiplier: 1,
                                                               constant: _actionsView!.frame.size.height)
            addConstraint(constH);
        }
        
        get {
            return _actionsView!
        }
    }
    
    
    static func instanceWithViewModel(_ viewModel: ViewModelType, actionsView: UIView) -> ActionsFadePresentingContainerStackView {
        let nibName = "ActionsFadePresentingContainerStackView"
        let container = Bundle.main.loadNibNamed(nibName,
                                                 owner: nil)!.first as! ActionsFadePresentingContainerStackView
        container.viewModel = viewModel
        container.actionsView = actionsView
        return container
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.type = .title
        titleContainerView.type = .card
        closeButton.type = .icon
        closeButton.setImage(UIImage(named: "Close_dualtone"), for: .normal)
    }
 
    
    
    @IBAction func closeButtonTapped() {
        viewModel?.handleCloseButtonTapped()
    }
}
