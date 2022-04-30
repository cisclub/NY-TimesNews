//
//  
//  ActionsFadePresentingCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//

import UIKit


class ActionsFadePresentingCoordinator: Coordinator {
    typealias InputType = ActionsFadePresentingCoordinatorInput
    typealias ActionsType = ActionsFadePresentingCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    private var coordinator: FadePresentingWithBottomContainerCoordinator? = nil

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let presentingViewController = input.presentingViewController
        let actions = ActionsFadePresentingViewModelActions { [weak self] in
            self?.actions.cancelAction()
        }
        let viewModel = ActionsFadePresentingViewModel(useCases: nil, actions: actions)
        let container = ActionsFadePresentingContainerStackView.instanceWithViewModel(viewModel)
        let coordinatorInput = FadePresentingWithBottomContainerCoordinatorInput(presentingViewController: presentingViewController,
                                                                                 bottomContainer: container)
        let coordinatorActions = FadePresentingWithBottomContainerCoordinatorActions { [weak self] in
            self?.actions.cancelAction()
        }
        let coordinator = FadePresentingWithBottomContainerCoordinator(input: coordinatorInput, actions: coordinatorActions)
        
        coordinator.start()
    }
}


struct ActionsFadePresentingCoordinatorInput {
    let presentingViewController: UIViewController
}


struct ActionsFadePresentingCoordinatorActions {
    let cancelAction: () -> ()
}
