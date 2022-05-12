//
//  AppCoordinator.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 26/01/2022.
//

import UIKit

final class AppCoordinator {
    typealias ViewModelType = String
    typealias InputType = UIWindow
    typealias UseCaseType = String
    typealias ActionsType = String
    
    
    var input: InputType
    var viewModel: ViewModelType
    var coordinator: OTPLoginCoordinator?
    var innerCoordinator: LinkedAccountsListCoordinator?
    
    
    init(input: InputType, viewModel: String) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {//make desision about the landing scene
        ApplicationTheme.setupNavigationBarTheme()
        
        let window = UIApplication.shared.windows.first!
        let input = OTPLoginCoordinatorInput(window: window)
        
        var dataSource: [StandardCellModel]? = nil
        let cellsActions = StandardCellActions { (selectedIndex, model) in
            for (index, model) in dataSource!.enumerated() {
                if index == selectedIndex {
                    model.state.value = .selected
                } else {
                    model.state.value = .normal
                }
            }
        }
        let actions = OTPLoginCoordinatorActions { presentingViewController in
            dataSource =
                        [
                            TextCellModel(useCases: nil,
                                          actions: nil,
                                          content: "The following are all the accounts under your Emirates ID that will be linked to and*****0:"),
                            LinkedAccountCellModel(useCases: nil,
                                                   actions: cellsActions,
                                                   profileImage: UIImage(named: "etisalatLogoVerticalEng")!,
                                                   name: "Ahmad",
                                                   description: "0508734558 - Postpaid"),
                            LinkedAccountCellModel(useCases: nil,
                                                   actions: cellsActions,
                                                   profileImage: UIImage(named: "etisalatLogoVerticalEng")!,
                                                   name: "Amin",
                                                   description: "0508734558 - Prepaid"),
                            LinkedAccountCellModel(useCases: nil,
                                                   actions: cellsActions,
                                                   profileImage: UIImage(named: "etisalatLogoVerticalEng")!,
                                                   name: "Amin",
                                                   description: "0508734558 - Prepaid"),
                            ButtonCellModel(useCases: nil, actions: StandardCellActions(cellSelected: { [weak self] index, model in
                                self!.innerCoordinator?.dismiss()
                            }), buttonTitle: Strings.saveAndContinue)
                        ]
                        let linkedAccountsInput = LinkedAccountsListCoordinatorInput(presentingViewController: presentingViewController,
                                                                                     dataSource: dataSource!,
                                                                                     title: Strings.linkedAccouts)
            let linkedAccountsActions = LinkedAccountsListCoordinatorActions {
                print("Dismissed")
            }
            self.innerCoordinator = LinkedAccountsListCoordinator(input: linkedAccountsInput,
                                                                  actions: linkedAccountsActions)
            
            self.innerCoordinator!.start()
            
//            let dataSource =
//            [
//                TextCellModel(useCases: nil,
//                              actions: nil,
//                              content: "The following are all the accounts under your Emirates ID that will be linked to and*****0:"),
//                LinkedAccountCellModel(useCases: nil, actions: nil,
//                                       profileImage: UIImage(named: "etisalatLogoVerticalEng")!,
//                                       name: "Ahmad",
//                                       description: "0508734558 - Postpaid"),
//                LinkedAccountCellModel(useCases: nil, actions: nil,
//                                       profileImage: UIImage(named: "etisalatLogoVerticalEng")!,
//                                       name: "Amin",
//                                       description: "0508734558 - Prepaid")
//            ]
//            let linkedAccountsInput = LinkedAccountsListCoordinatorInput(presentingViewController: presentingViewController,
//                                                                         dataSource: dataSource)
//            let linkedAccountsActions = LinkedAccountsListCoordinatorActions()
//            self.innerCoordinator = LinkedAccountsListCoordinator(input: linkedAccountsInput,
//                                                             actions: linkedAccountsActions)
//
//            self.innerCoordinator!.start()
            
            
//            let optionsInput = OTPLoginOptionsCoordinatorInput(presentingViewController: presentingViewController)
//            let optionsActions = OTPLoginOptionsCoordinatorActions {
//            } didSelectLoginWithUAEPass: {
//            }
//
//            self!.innerCoordinator = OTPLoginOptionsCoordinator(input: optionsInput,
//                                                          actions: optionsActions)
//            self!.innerCoordinator?.start()
        }
        coordinator = OTPLoginCoordinator(input: input, actions: actions)
        
        coordinator!.start()
    }
}

