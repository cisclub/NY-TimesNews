//
//  
//  FadePresentingViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//

import UIKit


struct FadePresentingViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = FadePresentingViewModelActions
    
    
    var viewController: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
}


extension FadePresentingViewModel {
    func handleBackgroundTapped(inViewController viewController: UIViewController) {
        actions.handleCancelAction(viewController)
    }
}


struct FadePresentingViewModelActions {
    let handleCancelAction: (UIViewController) -> ()
}
