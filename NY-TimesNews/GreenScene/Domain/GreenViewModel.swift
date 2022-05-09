//
//  
//  GreenViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//
import UIKit


struct GreenViewModel: ViewModel {
    typealias UseCasesType = GreenUseCases
    typealias ActionsType = GreenViewModelActions
    
    
    let viewController: UIViewController? = nil
    let useCases: UseCasesType
    let actions: ActionsType
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


struct GreenViewModelActions {
}
