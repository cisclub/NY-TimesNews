//
//  
//  LinkedAccountsListUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//
//


struct LinkedAccountsListUseCase: UseCase {
    typealias InputType = LinkedAccountsListInputType
    typealias ClosureType = Void?
    typealias ReturnType = Void?
    typealias RepoType = LinkedAccountsListRepo
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        return nil
    }
}


struct LinkedAccountsListInputType {
}
