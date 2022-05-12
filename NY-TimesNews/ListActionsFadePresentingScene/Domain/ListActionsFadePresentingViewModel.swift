//
//  
//  ListActionsFadePresentingViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//
import UIKit


struct ListActionsFadePresentingViewModel: ViewModel {
    
    
    typealias UseCasesType = ListActionsFadePresentingUseCases
    typealias ActionsType = ListActionsFadePresentingViewModelActions
    
    
    let viewController: UIViewController? = nil
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


struct ListActionsFadePresentingViewModelActions {
}
