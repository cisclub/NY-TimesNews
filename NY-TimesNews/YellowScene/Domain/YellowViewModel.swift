//
//  
//  YellowViewModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//
import UIKit


struct YellowViewModel: ViewModel {
    typealias UseCasesType = YellowUseCases
    typealias ActionsType = YellowViewModelActions
    
    
    let viewController: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
}


struct YellowViewModelActions {
}
