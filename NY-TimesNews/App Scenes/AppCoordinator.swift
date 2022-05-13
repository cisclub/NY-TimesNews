//
//  AppCoordinator.swift
//  NY-TimesNews
//
//  Created by Yahia Mosaad on 26/01/2022.
//

let IS_IPHONE = UIDevice().userInterfaceIdiom == .phone
let IS_IPHONE_6_PLUS_ONWARDS = IS_IPHONE && UIScreen.main.bounds.size.height >= 736.0
let IS_IPHONE_X_SERIES = IS_IPHONE && UIScreen.main.bounds.size.height >= 812.0



import UIKit

final class AppCoordinator {
    typealias ViewModelType = String
    typealias InputType = AppCoordinatorInput
    typealias UseCaseType = String
    typealias ActionsType = String
    
    
    var input: InputType
    var coordinator: OTPLoginCoordinator?
    var loginOptionsCoordinator: OTPLoginOptionsCoordinator?
    var loginCoordinator: OTPLoginCoordinator?
    
    
    init(input: InputType) {
        self.input = input
    }
    
    func start() {//make desision about the landing scene
        // Temporarily will run use case here. It shold be run in previous Coordinator view model instead
        let useCase = InitialLoginEntryUseCase(repo: nil)
        let loginEntry = useCase.execute(input: nil, finishHandler: nil)
        
        
        let input = OTPLoginCoordinatorInput(navigationController: input.navigationController,
                                             initialLoginEntry: loginEntry)
        let actions = OTPLoginCoordinatorActions(presentLoginOptions: showLoginOptions(_:),
                                                 needSwithLanguage: needToChangeLanguage)

        coordinator = OTPLoginCoordinator(input: input, actions: actions)
        
        coordinator!.start()
    }
    
    func showLoginOptions(_ presentingViewController: UIViewController) {
        let optionsInput = OTPLoginOptionsCoordinatorInput(presentingViewController: presentingViewController)
        let optionsActions = OTPLoginOptionsCoordinatorActions {
        } didSelectLoginWithUAEPass: {
        }
        
        loginOptionsCoordinator = OTPLoginOptionsCoordinator(input: optionsInput,
                                                            actions: optionsActions)
        loginOptionsCoordinator?.start()
    }
    
    func needToChangeLanguage() {
        let useCase = InitialLoginEntryUseCase(repo: nil)
        let loginEntry = useCase.execute(input: nil, finishHandler: nil)
        let loginInput = OTPLoginCoordinatorInput(navigationController: input.navigationController,
                                                  initialLoginEntry: loginEntry)
        let loginActions = OTPLoginCoordinatorActions(presentLoginOptions: showLoginOptions(_:),
                                                      needSwithLanguage: needToChangeLanguage)
        loginCoordinator = OTPLoginCoordinator(input: loginInput, actions: loginActions)
        loginCoordinator?.start()
    }
}

struct AppCoordinatorInput {
    let navigationController: UINavigationController
}
