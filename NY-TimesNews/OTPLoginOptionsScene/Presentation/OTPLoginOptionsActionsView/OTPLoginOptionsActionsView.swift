//
//  OTPLoginOptionsActionsView.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 01/05/2022.
//

import Foundation
import UIKit


class OTPLoginOptionsActionsView: UIView, MVVM {
    typealias ViewModelType = OTPLoginOptionsActionsViewModel
    
    
    @IBOutlet private var userNameButton: BaseButton!
    @IBOutlet private var uaePassButton: BaseButton!
    
    private var _viewModel: ViewModelType?
    var viewModel: OTPLoginOptionsActionsViewModel {
        return _viewModel!
    }
    
    
    class func instance(withModel viewModel: ViewModelType) -> OTPLoginOptionsActionsView {
        let nibName = "OTPLoginOptionsActionsView"
        let view = Bundle.main.loadNibNamed(nibName, owner: nil)!.first as! OTPLoginOptionsActionsView
        view._viewModel = viewModel
        
        return view
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNameButton.type = .greenBordered
        uaePassButton.type = .blackBordered
        
        
    }
}


struct OTPLoginOptionsActionsViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = Void?
    
    
    var viewController: UIViewController?
    var useCases: Void?
    var actions: Void?
}
