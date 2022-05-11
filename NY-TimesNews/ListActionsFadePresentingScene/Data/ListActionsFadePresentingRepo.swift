//
//  
//  ListActionsFadePresentingRepo.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


struct ListActionsFadePresentingRepo: Repository {
    typealias Input = ListActionsFadePresentingRepoInput
    typealias Output = Void?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct ListActionsFadePresentingRepoInput {
}
