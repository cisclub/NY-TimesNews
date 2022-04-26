//
//  LoginViewModel.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 22/04/2022.
//

import Foundation



final class LoginViewModel: ViewModel<LoginUseCase, LoginActions> {
    var errorMessage: String?
    var showLoadingIndicator = false
    var username: String?
    var email: String?
    var password: String?
}

extension LoginViewModel{//view to view model
    func didPressLoginButton(email: String?, poassword: String?) {
        showLoadingIndicator = true
        let input = LoginUseCaseInput(username: username!, email: email!, password: password!)
        _ = useCases?.execute(input, finishHandler: { user in
            if let user = user {
                if let loginAction = actions?.didLoginSuccessfully {
                    loginAction(user);
                }
            } else {
                if let failAction = actions?.didFailToLogin {
                    failAction()
                }
            }
        })
    }
}

struct User: Codable{
    let name: String
}
