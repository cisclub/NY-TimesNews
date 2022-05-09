//
//  
//  GreenUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


struct GreenUseCase: UseCase {
    typealias InputType = GreenInputType
    typealias ClosureType = String?
    typealias ReturnType = String?
    typealias RepoType = GreenRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        return nil
    }
}


struct GreenInputType {
}
