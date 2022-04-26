//
//  LoginRepository.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 22/04/2022.
//

import Combine

struct LoginRepoInput {
    let email: String
    let password: String
}

struct LoginRepository: Repository {
    var network: HTTPClient
    
    func execute(input: LoginRepoInput, finishHandler: (User) -> ()) {
        finishHandler(User(name: "Ali"))
    }
    
    typealias Input = LoginRepoInput
    typealias Output = User
}
