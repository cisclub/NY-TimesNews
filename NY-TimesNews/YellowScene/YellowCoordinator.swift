//
//  
//  YellowCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 09/05/2022.
//
//


struct YellowCoordinator: Coordinator {
    typealias InputType = YellowCoordinatorInput
    typealias ActionsType = YellowCoordinatorActions

    
    let input: InputType
    let actions: ActionsType

    
    init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
    }
}


struct YellowCoordinatorInput {
}


struct YellowCoordinatorActions {
}
