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
        let rowHeight = 65.0
        let bottomMargin = 54.0
        let height = CGFloat(input.dataSource.count) * rowHeight
        let actionsViewModel = ListActionsViewModel(useCases: nil,
                                                    actions: nil,
                                                    dataSource: input.dataSource,
                                                    backgroundColor: input.backgroundColor,
                                                    tableViewHeight: height + bottomMargin)
        let actionsView = ListActionsView.instance(withModel: actionsViewModel)
//        if let footerView = input.footerView {
//            actionsView.addArrangedSubview(footerView)
//            let viewsDictionary = ["child": footerView]
//            actionsView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[child(==100)]",
//                                                                      metrics: nil,
//                                                                      views: viewsDictionary))
//        }
        let actionsFadeInput = ActionsFadePresentingCoordinatorInput(presentingViewController: input.presentingViewController,
                                                                     title: input.title,
                                                                     actionsView:actionsView)
        let actionsFadeActions = ActionsFadePresentingCoordinatorActions { presentedViewController in
            presentedViewController.dismiss(animated: true)
        }
        fadeCoordinator = ActionsFadePresentingCoordinator(input: actionsFadeInput, actions: actionsFadeActions)
        fadeCoordinator!.start()
    }
}


struct ListActionsFadePresentingCoordinatorInput {
    let presentingViewController: UIViewController
    let title: String
    let dataSource: [StandardCellModel]
    let backgroundColor: UIColor
    let footerView: UIView?
}


struct ListActionsFadePresentingCoordinatorActions {
}
