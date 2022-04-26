//
//  LoginViewCoordinator.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 22/04/2022.
//

import UIKit


final class LoginCoordinator: Coordinator {
    typealias InputType = UINavigationController
    typealias ViewModelType = LoginViewModel
    typealias UseCaseType = LoginUseCase
    typealias ActionsType = LoginActions
    
    
    var input: UINavigationController
    var viewModel: LoginViewModel
    
    
    init(input: UINavigationController, viewModel: LoginViewModel) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {
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
        
        input.pushViewController(viewController, animated: true)
    }
    
    
    private func showHomeView(){
        
    }
}


struct LoginActions {
    let didLoginSuccessfully: (User) -> ()
    let didFailToLogin: () -> ()
    let forgotPassword: () -> ()
}
