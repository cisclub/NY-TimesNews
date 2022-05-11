//
//  
//  OTPLoginViewModel.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//
import UIKit


struct OTPLoginViewModel: ViewModel {
    typealias UseCasesType = OTPLoginUseCases?
    typealias ActionsType = OTPLoginViewModelActions
    typealias ViewType = UIViewController
    
    
    var view: UIViewController?
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    func showLoginOptions() {
        _ = useCases?.getLinkedAccountsUseCase.execute(input: nil,
                                                   finishHandler: { listOfAccounts in
            actions.needToShowLoginOptions()
        })
        actions.needToShowLoginOptions()
    }
}


struct OTPLoginViewModelActions {
    let needToShowLoginOptions: () -> ()
}
