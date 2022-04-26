//
//  LoginUseCase.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 22/04/2022.
//

import Combine

struct LoginUseCase: UseCase {
    let repo: LoginRepository?
    
    
    func execute(_ input: LoginUseCaseInput?, finishHandler: (User?) -> ()) {
        guard let input = input else {
            finishHandler(nil)
            return
        }

        guard !input.email.isEmpty else {
            finishHandler(nil)
            return
        }
        guard isValidEmail(input.email) else {
            finishHandler(nil)
            return
        }
        guard !input.password.isEmpty else {
            finishHandler(nil)
            return
        }
        
        let repoInput = LoginRepoInput(email: input.email, password: input.password)
        repo?.execute(input: repoInput, finishHandler: { user in
            finishHandler(user)
        })
    }
    
    private func isValidEmail(_ email: String)-> Bool{
        return true
    }
}

struct LoginUseCaseInput {
    let username: String
    let email: String
    let password: String
}
