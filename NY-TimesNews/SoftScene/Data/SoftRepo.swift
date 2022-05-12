//
//  
//  SoftRepo.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 12/05/2022.
//
//


struct SoftRepo: Repository {
    typealias Input = SoftRepoInput
    typealias Output = Void?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct SoftRepoInput {
}
