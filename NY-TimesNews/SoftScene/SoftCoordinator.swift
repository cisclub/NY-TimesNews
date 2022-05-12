//
//  
//  SoftCoordinator.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 12/05/2022.
//
//


class SoftCoordinator: Coordinator {
    typealias InputType = SoftCoordinatorInput
    typealias ActionsType = SoftCoordinatorActions

    
    let input: InputType
    let actions: ActionsType

    
    required init(input: InputType, actions: ActionsType) {
        self.input = input
        self.actions = actions
    }
    
    func start() {
    }
}


struct SoftCoordinatorInput {
}


struct SoftCoordinatorActions {
}
