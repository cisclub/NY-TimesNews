//
//  
//  FadePresentingWithBottomContainerCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//
import UIKit


class FadePresentingWithBottomContainerCoordinator: Coordinator {
    typealias InputType = FadePresentingWithBottomContainerCoordinatorInput
    typealias ActionsType = FadePresentingWithBottomContainerCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    var fadeCoordinator: FadePresentingCoordinator?

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let presentingViewController = input.presentingViewController
        let fadeCoordinatorInput = FadePresentingCoordinatorInput(presentingViewController: presentingViewController)
        let coordinatorActions = FadePresentingCoordinatorActions { [unowned self] presentedViewController in
            self.actions.cancelAction(presentedViewController)
        }
        fadeCoordinator = FadePresentingCoordinator(input: fadeCoordinatorInput, actions: coordinatorActions)
        let container = input.bottomContainer
        let view = fadeCoordinator!.viewController.view!
        addContainer(container, toParent: view)
        
        fadeCoordinator!.start()
    }
    
    func dismiss() {
        fadeCoordinator!.dismiss()
    }
}


// MARK: Bottom Container
extension FadePresentingWithBottomContainerCoordinator {
    private func addContainer(_ container: UIView, toParent parent: UIView) {
        parent.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        let views = ["parent": parent, "child": container]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[child]|",
                                                                   metrics: nil,
                                                                   views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[child]|",
                                                                 metrics: nil,
                                                                 views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
        NSLayoutConstraint.activate(verticalConstraints)
    }
}


struct FadePresentingWithBottomContainerCoordinatorInput {
    let presentingViewController: UIViewController
    let bottomContainer: UIView
}


struct FadePresentingWithBottomContainerCoordinatorActions {
    let cancelAction: (UIViewController) -> ()
}
