//
//  
//  SoftUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 12/05/2022.
//
//


struct SoftUseCase: UseCase {
    typealias InputType = SoftInputType
    typealias ClosureType = Void?
    typealias ReturnType = Void?
    typealias RepoType = SoftRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        return nil
    }
}


struct SoftInputType {
}
