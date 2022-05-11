//
//  LinkedAccountCellModel.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//

import Foundation


class LinkedAccountCellModel: StandardCellModel {
    let profileImage: UIImage
    let name: String
    let description: String
    
    
    
    init(useCases: StandardCellModel.UseCasesType,
         actions: StandardCellModel.ActionsType,
         profileImage: UIImage,
         name: String,
         description: String)
    {
        self.profileImage = profileImage
        self.name = name
        self.description = description
        
        super.init(useCases: useCases, actions: actions)
    }
    
    
    override func reusableIdentifier() -> String {
        return LinkedAccountCell.identifier()
    }
}
