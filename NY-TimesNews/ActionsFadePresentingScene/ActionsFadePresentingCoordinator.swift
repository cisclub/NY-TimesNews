//
//  
//  ActionsFadePresentingCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//

import UIKit


class ActionsFadePresentingCoordinator<MVVMType: UIView>: Coordinator where MVVMType: MVVM {
    typealias InputType = ActionsFadePresentingCoordinatorInput<MVVMType>
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
        let actions = ActionsFadePresentingViewModelActions { presentedViewController in
            presentedViewController.dismiss(animated: true)
        }
        let viewModel = ActionsFadePresentingViewModel(useCases: nil, actions: actions)
        viewModel.viewController = presentingViewController
        let container = ActionsFadePresentingContainerStackView.instanceWithViewModel(viewModel, actionsView: input.actionsView)
        container.title = input.title
        let coordinatorInput = FadePresentingWithBottomContainerCoordinatorInput(presentingViewController: presentingViewController,
                                                                                 bottomContainer: container)
        let coordinatorActions = FadePresentingWithBottomContainerCoordinatorActions { [weak self] presentedViewController in
            self?.actions.cancelAction(presentedViewController)
        }
        coordinator = FadePresentingWithBottomContainerCoordinator(input: coordinatorInput, actions: coordinatorActions)
        
        coordinator!.start()
    }
    
    func dismiss() {
        coordinator!.dismiss()
    }
}


struct ActionsFadePresentingCoordinatorInput<MVVMType> where MVVMType: MVVM {
    let presentingViewController: UIViewController
    let title: String
    let actionsView: MVVMType
}


struct ActionsFadePresentingCoordinatorActions {
    let cancelAction: (UIViewController) -> ()
}
