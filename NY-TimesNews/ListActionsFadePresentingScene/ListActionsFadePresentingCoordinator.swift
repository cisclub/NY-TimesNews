//
//  
//  ListActionsFadePresentingCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


class ListActionsFadePresentingCoordinator: Coordinator {
    typealias InputType = ListActionsFadePresentingCoordinatorInput
    typealias ActionsType = ListActionsFadePresentingCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    var fadeCoordinator: ActionsFadePresentingCoordinator<ListActionsView>?

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let presentingViewControllerHeight = input.presentingViewController.view.frame.size.height
        let actionsViewModel = ListActionsViewModel(useCases: nil,
                                                    actions: nil,
                                                    dataSource: input.dataSource,
                                                    backgroundColor: input.backgroundColor,
                                                    presentingViewControllerHeight: presentingViewControllerHeight);
        let actionsView = ListActionsView.instance(withModel: actionsViewModel)
        let actionsFadeInput = ActionsFadePresentingCoordinatorInput(presentingViewController: input.presentingViewController,
                                                                     title: input.title,
                                                                     actionsView:actionsView)
        let actionsFadeActions = ActionsFadePresentingCoordinatorActions { [weak self] presentedViewController in
            presentedViewController.dismiss(animated: true) {
                self?.actions.wasDismissed()
            }
        }
        fadeCoordinator = ActionsFadePresentingCoordinator(input: actionsFadeInput, actions: actionsFadeActions)
        fadeCoordinator!.start()
    }
    
    func dismiss() {
        self.fadeCoordinator?.dismiss()
    }
}


struct ListActionsFadePresentingCoordinatorInput {
    let presentingViewController: UIViewController
    let title: String
    let dataSource: [StandardCellModel]
    let backgroundColor: UIColor
}


struct ListActionsFadePresentingCoordinatorActions {
    let wasDismissed: () -> ()
}
