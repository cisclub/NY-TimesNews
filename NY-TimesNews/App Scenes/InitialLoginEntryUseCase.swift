//
//  
//  InitialLoginEntryUseCase.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 13/05/2022.
//
//


struct InitialLoginEntryUseCase: UseCase {
    typealias InputType = Void?
    typealias ClosureType = Void?
    typealias ReturnType = OTPLoginViewModel.LoginEntry
    typealias RepoType = Void?
    
    
    let repo: RepoType

    
    func execute(input: InputType, finishHandler:ClosureType) -> ReturnType {
        let touchIDLoginEnabled = ApplicationLogicMock.isTouchIdLoginEnabled()
        let passwordChanged = ApplicationLogicMock.isUserPasswordChanged()
        
        if touchIDLoginEnabled && !passwordChanged {
            if IS_IPHONE_X_SERIES {
                return .faceID
            } else {
                return .touchID
            }
        } else {
            return .mobileNumber
        }
    }
}
