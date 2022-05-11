//
//  
//  LinkedAccountsListViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//
import UIKit


struct LinkedAccountsListViewModel: ViewModel {
    typealias UseCasesType = LinkedAccountsListUseCases
    typealias ActionsType = LinkedAccountsListViewModelActions
    typealias ViewType = Void?
    
    
    let view: ViewType?
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
    }
}


struct LinkedAccountsListViewModelActions {
}
