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
        let launchStateManager: LaunchStateManager = .init()
        let status = launchStateManager.getLaunchState()
        
        switch status {
        case .guest, .onboarding:
            let repo = LoginRepository(network: HTTPClient.defaultClient)
            let useCase = LoginUseCase(repo: repo)
            let actions = LoginActions { user in
                // Move to home screen
            } didFailToLogin: {
                // Show failure alert
            } forgotPassword: {
                // Move to forgot password scene
            }
            
            let viewModel = LoginViewModel(actions: actions,
                                           useCases: useCase)
            let viewController: LoginViewController = .instanceFromStoryboard(withViewModel: viewModel)
            let coordinator: LoginCoordinator = .init(input: UINavigationController(rootViewController: viewController),
                                                      viewModel: viewModel)
            coordinator.start()
        case .loggedIn:
            break
//            let coordinator: NewsListCoordinator = .init(navigationController: navigationController)
//            coordinator.start()
        }
        
        input.rootViewController = UINavigationController()
        input.makeKeyAndVisible()
    }
}

