//
//  
//  OTPLoginUseCase.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


struct OTPLoginUseCase: UseCase {
    typealias InputType = OTPLoginInputType
    typealias ClosureType = Void?
    typealias ReturnType = String?
    typealias RepoType = OTPLoginRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        return nil
    }
}


struct OTPLoginInputType {
}
