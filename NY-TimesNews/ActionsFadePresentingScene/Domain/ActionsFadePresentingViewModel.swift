//
//  
//  ActionsFadePresentingViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//


import UIKit


class ActionsFadePresentingViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = ActionsFadePresentingViewModelActions
    
    
    var viewController: UIViewController? = nil
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


extension ActionsFadePresentingViewModel {
    func handleCloseButtonTapped() {
        actions.cancelAction(viewController!)
    }
}


struct ActionsFadePresentingViewModelActions {
    let cancelAction: (UIViewController) -> ()
}
