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
    private weak var loginViewController: UIViewController?
    private var actionsCoordinator: ActionsFadePresentingCoordinator<LoginInfoActions>?
    var replaceViewControllers = false

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start(replaceViewControllers: Bool = false) {
        self.replaceViewControllers = replaceViewControllers
        
        start()
    }
    
    func start() {
        let actions = OTPLoginViewModelActions(needToShowLoginOptions: needToShowLoginOptions,
                                               infoButtonTapped: infoButtonTapped,
                                               languageButtonTapped: languageButtonTapped)
        let repo = LinkedAccountsRepo(network: NetworkManager.self)
        let useCases = OTPLoginUseCases(getLinkedAccountsUseCase: GetLinkedAccountsUseCase(repo: repo))
        let viewModel = OTPLoginViewModel(useCases: useCases, actions: actions, loginEntry: input.initialLoginEntry)
        let otpLoginViewControler = OTPLoginViewController.instanceFromStoryboard(withViewModel: viewModel, fromStoryboard: "OTPLoginScene")
        loginViewController = otpLoginViewControler
        
        if replaceViewControllers {
            input.navigationController.pushViewController(otpLoginViewControler, animated: true)
        } else {
            input.navigationController.setViewControllers([otpLoginViewControler], animated: false)
        }
    }
    
    func needToShowLoginOptions() {
        actions.presentLoginOptions(loginViewController!)
    }
    
    func infoButtonTapped() {
        let model = LoginInfoActionsModel(useCases: nil, actions: nil)
        let actionsView = LoginInfoActions.instance(withModel: model)
        let input = ActionsFadePresentingCoordinatorInput(presentingViewController: loginViewController!,
                                                          title: Strings.loginToMyEtisalat,
                                                          actionsView: actionsView)
        let actions = ActionsFadePresentingCoordinatorActions { presentedViewController in
            presentedViewController.dismiss(animated: true)
        }
        actionsCoordinator = ActionsFadePresentingCoordinator(input: input,
                                                           actions: actions)
        actionsCoordinator!.start()
    }
    
    func languageButtonTapped() {
        actions.needSwithLanguage()
    }
}


struct OTPLoginCoordinatorInput {
    let navigationController: UINavigationController
    let initialLoginEntry: OTPLoginViewModel.LoginEntry
}


struct OTPLoginCoordinatorActions {
    let presentLoginOptions: (UIViewController) -> ()
    let needSwithLanguage: () -> ()
}
