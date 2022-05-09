//
//  
//  GreenCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//

import UIKit


struct GreenCoordinator: Coordinator {
    typealias InputType = GreenCoordinatorInput
    typealias ActionsType = GreenCoordinatorActions

    
    let input: InputType
    let actions: ActionsType

    
    init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
        let vm = GreenViewModel(useCases: GreenUseCases(),
                                actions: GreenViewModelActions())
        let vc = GreenViewController.instanceFromStoryboard(withViewModel: vm,
                                                            fromStoryboard: "GreenScene")
        vc.title = "asdfasdf"
        let nc = UINavigationController(rootViewController: vc)
        input.window.rootViewController = nc
        input.window.makeKeyAndVisible()
    }
}


struct GreenCoordinatorInput {
    let window: UIWindow
}


struct GreenCoordinatorActions {
}
