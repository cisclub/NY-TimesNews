//
//  
//  OTPLoginRepo.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


struct OTPLoginRepo: Repository {
    typealias Input = OTPLoginRepoInput
    typealias Output = Void?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct OTPLoginRepoInput {
}
