//
//  
//  LoginEntryFaceID.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 13/05/2022.
//
//


import Foundation


class LoginEntryFaceID: UIStackView, MVVM {
    typealias ViewModelType = LoginEntryFaceIDModel
    
    
    @IBOutlet private var textLabel: BaseLabel!
    var viewModel: ViewModelType?
    
    
    class func instance(withModel viewModel: ViewModelType) -> LoginEntryFaceID {
        let nibName = "LoginEntryFaceID"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! LoginEntryFaceID
        view.viewModel = viewModel
        
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLabel.type = .h5
        textLabel.textAlignment = .center
        textLabel.textColor = .appActive
    }
}


class LoginEntryFaceIDModel: ViewModel {
    typealias UseCasesType = LoginEntryFaceIDUseCases?
    typealias ActionsType = LoginEntryFaceIDActions?
    
    
    let useCases: UseCasesType
    let actions: ActionsType
    
    
    init(useCases: UseCasesType, actions: ActionsType) {
        self.useCases = useCases
        self.actions = actions
    }
}


struct LoginEntryFaceIDUseCases {
}


struct LoginEntryFaceIDActions {
}

