//
//  
//  ActionsFadePresentingViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//


struct ActionsFadePresentingViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = ActionsFadePresentingViewModelActions
    
    
    let useCases: UseCasesType
    let actions: ActionsType
}


struct ActionsFadePresentingViewModelActions {
    let cancelAction: () -> ()
}
