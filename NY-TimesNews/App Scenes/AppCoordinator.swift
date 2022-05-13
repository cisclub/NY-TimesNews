//
//  AppCoordinator.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 26/01/2022.
//

import UIKit

final class AppCoordinator {
    typealias ViewModelType = String
    typealias InputType = UIWindow
    typealias UseCaseType = String
    typealias ActionsType = String
    
    
    var input: InputType
    var viewModel: ViewModelType
    var coordinator: OTPLoginCoordinator?
    var innerCoordinator: OTPLoginOptionsCoordinator?
    
    
    init(input: InputType, viewModel: String) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {//make desision about the landing scene
        
        let window = UIApplication.shared.windows.first!
        let input = OTPLoginCoordinatorInput(window: window)
        let actions = OTPLoginCoordinatorActions { [weak self] presentingViewController in
            let optionsInput = OTPLoginOptionsCoordinatorInput(presentingViewController: presentingViewController)
            let optionsActions = OTPLoginOptionsCoordinatorActions {
            } didSelectLoginWithUAEPass: {
            }
            
            self!.innerCoordinator = OTPLoginOptionsCoordinator(input: optionsInput,
                                                                actions: optionsActions)
            self!.innerCoordinator?.start()
        }
        coordinator = OTPLoginCoordinator(input: input, actions: actions)
        
        coordinator!.start()
    }
}

