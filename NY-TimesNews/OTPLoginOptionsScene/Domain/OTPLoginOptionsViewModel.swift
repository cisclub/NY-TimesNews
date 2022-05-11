//
//  
//  OTPLoginOptionsViewModel.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//
import UIKit


struct OTPLoginOptionsViewModel: ViewModel {
    typealias UseCasesType = OTPLoginOptionsUseCases
    typealias ActionsType = OTPLoginOptionsViewModelActions
    typealias ViewType = UIViewController
    
    
    var view: UIViewController?
    var viewController: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
}


struct OTPLoginOptionsViewModelActions {
}
