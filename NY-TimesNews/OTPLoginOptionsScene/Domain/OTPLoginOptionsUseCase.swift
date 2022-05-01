//
//  
//  OTPLoginOptionsUseCase.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


struct OTPLoginOptionsUseCase: UseCase {
    typealias InputType = OTPLoginOptionsInputType
    typealias ClosureType = () -> ()?
    typealias ReturnType = String?
    typealias RepoType = OTPLoginOptionsRepo
    
    
    let repo: RepoType

    
    func execute(input: OTPLoginOptionsInputType, finishHandler: () -> ()?) -> String? {
        return nil
    }
}


struct OTPLoginOptionsInputType {
}
