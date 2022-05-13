//
//  
//  OTPLoginCoordinator.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//

import UIKit


class OTPLoginCoordinator: Coordinator {
    typealias InputType = OTPLoginCoordinatorInput
    typealias ActionsType = OTPLoginCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    private var nextViewController: UIViewController?

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let actions = OTPLoginViewModelActions(needToShowLoginOptions: needToShowLoginOptions)
        let repo = LinkedAccountsRepo(network: NetworkManager.self)
        let useCases = OTPLoginUseCases(getLinkedAccountsUseCase: GetLinkedAccountsUseCase(repo: repo))
        let viewModel = OTPLoginViewModel(useCases: useCases, actions: actions, loginEntry: .faceID)
        let otpLoginViewControler = OTPLoginViewController.instanceFromStoryboard(withViewModel: viewModel, fromStoryboard: "OTPLoginScene")
        nextViewController = otpLoginViewControler
        
        input.window.rootViewController = otpLoginViewControler
        input.window.makeKeyAndVisible()
    }
    
    func needToShowLoginOptions() {
        actions.presentLoginOptions(nextViewController!)
    }
}


struct OTPLoginCoordinatorInput {
    let window: UIWindow
}


struct OTPLoginCoordinatorActions {
    let presentLoginOptions: (UIViewController) -> ()
}
