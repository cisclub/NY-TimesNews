//
//  
//  ListActionsFadePresentingUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


struct ListActionsFadePresentingUseCase: UseCase {
    typealias InputType = ListActionsFadePresentingInputType
    typealias ClosureType = Void?
    typealias ReturnType = Void?
    typealias RepoType = ListActionsFadePresentingRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        return nil
    }
}


struct ListActionsFadePresentingInputType {
}
