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
    typealias ViewType = UIViewController
    
    
    var view: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


struct GreenViewModelActions {
}
