//
//  ActionsFadePresentingContainerStackView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//

import Foundation
import UIKit


class ActionsFadePresentingContainerStackView: UIStackView {
    typealias ViewModelType = ActionsFadePresentingViewModel
    
    
    private var viewModel: ViewModelType?
    
    
    static var nibName: String {
        return "\(Self.self)"
    }
    
    
    static func instanceWithViewModel(_ viewModel: ViewModelType) -> ActionsFadePresentingContainerStackView {
        let container = Bundle.main.loadNibNamed(ActionsFadePresentingContainerStackView.nibName,
                                                 owner: nil)!.first as! ActionsFadePresentingContainerStackView
        container.viewModel = viewModel
        return container
    }
}


// MARK: Actions
extension ActionsFadePresentingContainerStackView {
    @IBAction func closeButtonTapped() {
        viewModel!.actions.cancelAction()
    }
}
