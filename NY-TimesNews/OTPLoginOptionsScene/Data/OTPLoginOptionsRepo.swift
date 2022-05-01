//
//  
//  OTPLoginOptionsRepo.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


struct OTPLoginOptionsRepo: Repository {
    typealias Input = OTPLoginOptionsRepoInput
    typealias Output = Void?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct OTPLoginOptionsRepoInput {
}
