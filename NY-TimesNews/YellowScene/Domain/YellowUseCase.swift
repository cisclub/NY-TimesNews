//
//  
//  YellowUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


struct YellowUseCase: UseCase {
    typealias InputType = YellowInputType
    typealias ClosureType = <#closur type#>
    typealias ReturnType = <#return type#>
    typealias RepoType = YellowRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        
    }
}


struct YellowInputType {
}
