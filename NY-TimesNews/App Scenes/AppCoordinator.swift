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
    var coordinator: AnyObject?
    var innerCoordinator: OTPLoginOptionsCoordinator?
    
    
    init(input: InputType, viewModel: String) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {//make desision about the landing scene
        let window = UIApplication.shared.windows.first!
        let input = OTPLoginCoordinatorInput(window: window) { selectedOption in
            
        }
        let actions = OTPLoginCoordinatorActions { [weak self] viewController in
            let optionsInput = OTPLoginOptionsCoordinatorInput(presentingViewController: viewController)
            let optionsAction = OTPLoginOptionsCoordinatorActions { selectedOption in
                
            }
            self?.innerCoordinator = OTPLoginOptionsCoordinator(input: optionsInput,
                                                                actions: optionsAction)
            self?.innerCoordinator!.start()
        }
        coordinator = OTPLoginCoordinator(input: input, actions: actions)
        
        (coordinator as! OTPLoginCoordinator).start()
    }
}

