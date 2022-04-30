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
    
    
    init(input: InputType, viewModel: String) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {//make desision about the landing scene
        let window = UIApplication.shared.windows.first!
        let root = UIViewController()
        window.rootViewController = root
        root.view.backgroundColor = .white
        window.makeKeyAndVisible()
        
        
        let coordinatorInput = ActionsFadePresentingCoordinatorInput(presentingViewController: root)
        let coordinatorActions = ActionsFadePresentingCoordinatorActions {
            root.dismiss(animated: true)
        }
        let coordinator = ActionsFadePresentingCoordinator(input: coordinatorInput,
                                                           actions: coordinatorActions)
        
        coordinator.start()
    }
}

