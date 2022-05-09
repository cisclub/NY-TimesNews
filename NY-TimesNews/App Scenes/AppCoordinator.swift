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
    var coordinator: GreenCoordinator?
    var innerCoordinator: GreenCoordinator?
    
    
    init(input: InputType, viewModel: String) {
        self.input = input
        self.viewModel = viewModel
    }
    
    func start() {//make desision about the landing scene
        ApplicationTheme.setupNavigationBarTheme()
        
        let window = UIApplication.shared.windows.first!
        let input = OTPLoginCoordinatorInput(window: window)
        let actions = OTPLoginCoordinatorActions { [weak self] viewController in
        }
        coordinator = GreenCoordinator(input: GreenCoordinatorInput(window: window), actions: GreenCoordinatorActions())
        
        coordinator!.start()
    }
}

