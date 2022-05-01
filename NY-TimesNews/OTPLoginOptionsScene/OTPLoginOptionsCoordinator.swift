//
//  
//  OTPLoginOptionsCoordinator.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//

import UIKit


class OTPLoginOptionsCoordinator: Coordinator {
    typealias InputType = OTPLoginOptionsCoordinatorInput
    typealias ActionsType = OTPLoginOptionsCoordinatorActions

    
    enum LoginOption {
        case loginWithUserName
        case loginWithUAEPass
    }
    
    
    let input: InputType
    let actions: ActionsType
    var coordinator: ActionsFadePresentingCoordinator?

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let viewModel = OTPLoginOptionsActionsViewModel()
        let actionsView = OTPLoginOptionsActionsView.instance(withModel: viewModel)
        let actionsFadeInput = ActionsFadePresentingCoordinatorInput(presentingViewController: input.presentingViewController,
                                                                     actionsView:actionsView)
        let actionsFadeActions = ActionsFadePresentingCoordinatorActions { presentedViewController in
            presentedViewController.dismiss(animated: true)
        }
        coordinator = ActionsFadePresentingCoordinator(input: actionsFadeInput,
                                                       actions: actionsFadeActions)
        coordinator!.start()
    }
}


struct OTPLoginOptionsCoordinatorInput {
    let presentingViewController: UIViewController
}


struct OTPLoginOptionsCoordinatorActions {
    let didSelectOTPLoginOption: (OTPLoginOptionsCoordinator.LoginOption) -> ()
}
