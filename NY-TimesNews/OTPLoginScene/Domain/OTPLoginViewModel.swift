//
//  
//  OTPLoginViewModel.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//
import UIKit


class OTPLoginViewModel: ViewModel {
    enum LoginEntry {
        case mobileNumber
        case faceID
        case touchID
    }
    
    
    typealias UseCasesType = OTPLoginUseCases
    typealias ActionsType = OTPLoginViewModelActions
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    var loginEntry: Observable<LoginEntry>
    
    
    init(useCases: UseCasesType, actions: ActionsType, loginEntry: LoginEntry) {
        self.useCases = useCases
        self.actions = actions
        self.loginEntry = Observable<LoginEntry>(loginEntry)
    }
    
    func showLoginOptions() {
        _ = useCases.getLinkedAccountsUseCase.execute(input: ANYInput(value: "asdfasdf"),
                                                      finishHandler: { listOfAccounts in
            actions.needToShowLoginOptions()
        })
        actions.needToShowLoginOptions()
    }
    
    func languageButtonTapped() {
        GlobalBaseClassMock.latestMenuResponse = nil
        
        let bundle = Bundle()
        if LanguageHandlerMock.selectedLanguage == EnglishLanguage  {
            LanguageHandlerMock.setLanguage(ArabicLanguage)
            bundle.setLanguage("ar")
            CommonMethodsMock.fireEvent(withTag: kLoginScreenArabicLanguageSelected)
        }
        else{
            LanguageHandlerMock.setLanguage(EnglishLanguage)
            bundle.setLanguage("en")
            CommonMethodsMock.fireEvent(withTag: kLoginScreenEnglishLanguageSelected)
        }
        
        actions.languageButtonTapped()
    }
}


struct OTPLoginViewModelActions {
    let needToShowLoginOptions: () -> ()
    let infoButtonTapped: () -> ()
    let languageButtonTapped: () -> ()
}
