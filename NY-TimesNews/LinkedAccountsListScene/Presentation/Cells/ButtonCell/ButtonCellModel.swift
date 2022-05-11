//
//  ButtonCellModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 11/05/2022.
//

import Foundation


class ButtonCellModel: StandardCellModel {
    let buttonTitle: String
    
    
    init(useCases: StandardCellModel.UseCasesType, actions: StandardCellModel.ActionsType, buttonTitle: String) {
        self.buttonTitle = buttonTitle
        
        super.init(useCases: useCases, actions: actions)
    }
    
    
    override func reusableIdentifier() -> String {
        return ButtonCell.identifier()
    }
}
