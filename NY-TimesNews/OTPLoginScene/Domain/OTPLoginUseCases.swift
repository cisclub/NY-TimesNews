//
//  
//  OTPLoginUseCases.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


struct OTPLoginUseCases {
    let getLinkedAccountsUseCase: GetLinkedAccountsUseCase
}

struct GetLinkedAccountsUseCase: UseCase {
    func execute(input: ANYInput, finishHandler: ([String]) -> ()) -> String? {
        return nil
    }
    
    
    var repo: LinkedAccountsRepo
    
    
    typealias InputType = ANYInput
    typealias ClosureType = ([String]) -> ()
    typealias ReturnType = String?
    typealias RepoType = LinkedAccountsRepo
}

struct LinkedAccountsRepo: Repository {
    var network: NetworkManager.Type
    
    func execute(input: Void?, finishHandler: ([String]) -> ()) -> String? {
        return nil
    }
    
    typealias InputType = Void?
    typealias ClosureType = ([String]) -> ()
    typealias ReturnType = String?
}

struct ANYInput {
    let value: String
}
