//
//  
//  LinkedAccountsListCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


class LinkedAccountsListCoordinator: Coordinator {
    typealias InputType = LinkedAccountsListCoordinatorInput
    typealias ActionsType = LinkedAccountsListCoordinatorActions

    
    let input: InputType
    let actions: ActionsType
    var actionsListCoordinator: ListActionsFadePresentingCoordinator?
    
    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let v = UIView()
        v.backgroundColor = .red
        let actionsListInput = ListActionsFadePresentingCoordinatorInput(presentingViewController: input.presentingViewController,
                                                                         title: "LINKED ACCOUNTS",
                                                                         dataSource: input.dataSource,
                                                                         backgroundColor: UIColor.white,
                                                                         footerView: v)
        let actions = ListActionsFadePresentingCoordinatorActions()
        actionsListCoordinator = ListActionsFadePresentingCoordinator(input: actionsListInput,
                                                                          actions: actions)
        
        actionsListCoordinator!.start()
    }
}


struct LinkedAccountsListCoordinatorInput {
    let presentingViewController: UIViewController
    let dataSource: [StandardCellModel]
}


struct LinkedAccountsListCoordinatorActions {
}
