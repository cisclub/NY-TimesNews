//
//  ActionsFadePresentingContainerStackView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//

import Foundation
import UIKit


class ActionsFadePresentingContainerStackView<ActionsViewType: UIView>: UIStackView, MVVM where ActionsViewType: MVVM {
    typealias ViewModelType = ActionsFadePresentingViewModel
    
    
    
    @IBOutlet private var titleLabel: BaseLabel!
    @IBOutlet private var titleContainerView: BaseView!
    @IBOutlet private var closeButton: BaseButton!
    @IBOutlet private var actionsViewContainer: UIView!
    
    
    private var _viewModel: ActionsFadePresentingViewModel?
    var viewModel: ActionsFadePresentingViewModel {
        return _viewModel!
    }
    
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    private var _actionsView: ActionsViewType?
    private var actionsView: ActionsViewType {
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
    
    
    
    
    static func instanceWithViewModel(_ viewModel: ViewModelType, actionsView: ActionsViewType) -> ActionsFadePresentingContainerStackView {
        let nibName = "ActionsFadePresentingContainerStackView"
        let container = Bundle.main.loadNibNamed(nibName,
                                                 owner: nil)!.first as! ActionsFadePresentingContainerStackView
        container._viewModel = viewModel
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
        viewModel.handleCloseButtonTapped()
    }
}


class NibLoadableActionsFadePresentingContainerStackView: ActionsFadePresentingContainerStackView<OTPLoginOptionsActionsView> {
}
