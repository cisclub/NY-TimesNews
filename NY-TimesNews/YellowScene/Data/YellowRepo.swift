//
//  
//  YellowRepo.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


struct YellowRepo: Repository {
    typealias Input = YellowRepoInput
    typealias Output = <#output type#>
    
    
    let network : NetworkManager.Type
    
    
    func execute(input: Input, finishHandler: (Output) -> ()) {
    }
}


struct YellowRepoInput {
}
