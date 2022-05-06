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
        
        userNameButton.type = .custom(textColor: .white,
                                      bgColor: .mainThemeColor,
                                      cornerRadius: userNameButton.frame.size.height / 2,
                                      borderColor: nil,
                                      margin: 0.0)
        userNameButton.titleLabel?.font = .h4
        uaePassButton.type = .custom(textColor: .black,
                                     bgColor: .white,
                                     cornerRadius: 20.0,
                                     borderColor: .black,
                                     margin: 0.0)
        
        userNameButton.setTitle(Strings.loginWithUsername, for: .normal)
        uaePassButton.setTitle(Strings.signInWithUAEPass, for: .normal)
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        addDashedBorder()
    }
    
    
    @IBAction func loginWithUsernameTapped() {
        viewModel.handleLoginWithUSernameSelected()
    }
    
    @IBAction func loginWithUAEPassTapped() {
        viewModel.handleLoginWithUAEPassSelected()
    }
}


struct OTPLoginOptionsActionsViewModel: ViewModel {
    typealias UseCasesType = Void?
    typealias ActionsType = OTPLoginOptionsActionsViewModelActions
    
    
    var viewController: UIViewController?
    var useCases: Void?
    var actions: ActionsType
    
    
    func handleLoginWithUSernameSelected() {
        actions.didSelectLoginWithUsername()
    }
    
    func handleLoginWithUAEPassSelected() {
        actions.didSelectLoginWithUAEPass()
    }
}

struct OTPLoginOptionsActionsViewModelActions {
    let didSelectLoginWithUsername: () -> ()
    let didSelectLoginWithUAEPass: () -> ()
}


extension UIView {
  func addDashedBorder() {
    let color = UIColor.red.cgColor

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = color
    shapeLayer.lineWidth = 3
    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
    shapeLayer.lineDashPattern = [6,6]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}
