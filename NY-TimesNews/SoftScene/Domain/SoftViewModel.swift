//
//  
//  SoftViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 12/05/2022.
//
//
import UIKit


class SoftViewModel: ViewModel {
    typealias UseCasesType = SoftUseCases
    typealias ActionsType = SoftViewModelActions
    typealias ViewType = SoftViewController
    
    
    weak var view: ViewType?
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
        self.view = nil
    }
}


struct SoftViewModelActions {
}
