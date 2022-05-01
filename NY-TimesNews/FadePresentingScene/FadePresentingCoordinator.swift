//
//  
//  FadePresentingCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//

import UIKit


class FadePresentingCoordinator: Coordinator {
    typealias InputType = FadePresentingCoordinatorInput
    typealias ActionsType = FadePresentingCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    let viewController: FadePresentingViewController

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
        
        let viewModelActions = FadePresentingViewModelActions { presentedViewController in
            actions.cancelAction(presentedViewController)
        }
        let viewModel = FadePresentingViewModel(useCases: nil, actions: viewModelActions)
        let fadeViewController = FadePresentingViewController.instanceFromNib(withViewModel: viewModel)
        self.viewController = fadeViewController as! FadePresentingViewController
    }
    
    func start() {
        viewController.modalPresentationStyle = .overCurrentContext
        input.presentingViewController.present(viewController, animated: true)
    }
    
    func dismiss() {
        viewController.backgroundTapped()
    }
}


struct FadePresentingCoordinatorInput {
    let presentingViewController: UIViewController
}


struct FadePresentingCoordinatorActions {
    let cancelAction: (UIViewController) -> ()
}
