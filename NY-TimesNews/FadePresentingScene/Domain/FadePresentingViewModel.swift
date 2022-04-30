//
//  
//  FadePresentingViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//


struct FadePresentingViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = FadePresentingViewModelActions
    
    
    let useCases: UseCasesType
    let actions: ActionsType
}


struct FadePresentingViewModelActions {
    let handleCancelAction: () -> ()
}
