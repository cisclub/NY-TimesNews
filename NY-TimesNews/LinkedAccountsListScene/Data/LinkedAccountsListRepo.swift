//
//  
//  LinkedAccountsListRepo.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


struct LinkedAccountsListRepo: Repository {
    typealias Input = LinkedAccountsListRepoInput
    typealias Output = Void?
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct LinkedAccountsListRepoInput {
}
