//
//  
//  GreenRepo.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


struct GreenRepo: Repository {
    typealias Input = GreenRepoInput
    typealias Output = String?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct GreenRepoInput {
}
