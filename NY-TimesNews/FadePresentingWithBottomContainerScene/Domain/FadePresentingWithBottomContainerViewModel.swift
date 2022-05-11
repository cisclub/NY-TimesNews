//
//  
//  FadePresentingWithBottomContainerViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//
import UIKit


struct FadePresentingWithBottomContainerViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = FadePresentingWithBottomContainerViewModelActions
    typealias ViewType = UIViewController
    
    
    var view: UIViewController?
    var viewController: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
}


struct FadePresentingWithBottomContainerViewModelActions {
}
