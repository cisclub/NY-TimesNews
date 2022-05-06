//
//  
//  OTPRemoveActionsView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 02/05/2022.
//
//


import UIKit


class OTPRemoveActionsView: UIView, MVVM {
    typealias ViewModelType = OTPRemoveActionsViewModel
    
    
    private var _viewModel: ViewModelType?
    var viewModel: ViewModelType {
        return _viewModel!
    }
    
    
    class func instance(withModel viewModel: ViewModelType) -> OTPRemoveActionsView {
        let nibName = "OTPRemoveActionsView"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! OTPRemoveActionsView
        view._viewModel = viewModel
        
        return view
    }
}


extension OTPRemoveActionsView {
    // View configuration goes here
    // Add @IBOutlets, custom rendering ...etc
}


struct OTPRemoveActionsViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = OTPRemoveActionsViewModelActions
    
    
    var viewController: UIViewController?
    var useCases: Void?
    var actions: ActionsType
    
    // Handle view logic
    // Handle view actions and call self.actions
}


struct OTPRemoveActionsViewModelActions {
    // Actions
}
