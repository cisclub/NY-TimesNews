//
//  
//  OTPLoginViewController.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 29/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//
//


import UIKit


class OTPLoginViewController: StandardViewController<OTPLoginViewModel> {
    @IBOutlet private var orLabel: BaseLabel!
    @IBOutlet private var headerLabel: BaseLabel!
    @IBOutlet private var loginOptionsButton: BaseButton!
    @IBOutlet private var continueAsGuestButton: BaseButton!
    @IBOutlet private var loginEntryStackView: UIStackView!
    @IBOutlet private var languageButton: BaseButton!
    
    let stackViewSpacing = 29.0
    private var loginEntry: OTPLoginViewModel.LoginEntry = .mobileNumber {
        didSet {
            if let entry = loginEntryStackView.arrangedSubviews.first, loginEntryStackView.arrangedSubviews.count > 1 {
                // loginEntryStackView.removeArrangedSubview(entry) // Doesn't remove it from memory
                entry.removeFromSuperview() // Has to be called to remove the view from memory and entirely from stack view
            }
            switch loginEntry {
            case .mobileNumber:
                loginEntryStackView.insertArrangedSubview(getMobileNumberEntryField(), at: 0)
                loginEntryStackView.spacing = stackViewSpacing // has to be set again after adding new arranged subview to take affect
            case .faceID:
                loginEntryStackView.insertArrangedSubview(getFaceIDLoginEntry(), at: 0)
                loginEntryStackView.spacing = stackViewSpacing // has to be set again after adding new arranged subview to take affect
            case .touchID:
                break
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orLabel.text = "or".localized
        orLabel.font = .regular
        orLabel.textColor = .appDisableButtonText
        orLabel.textAlignment = .center
        
        headerLabel.type = .title
        headerLabel.text = Strings.loginToMyEtisalat
        headerLabel.textAlignment = .center
        
        
        
        loginOptionsButton.type = .custom(textColor: .appActive,
                                          bgColor: .white,
                                          cornerRadius: loginOptionsButton.frame.size.height / 2,
                                          borderColor: .appActive,
                                          margin: 5)
        loginOptionsButton.titleLabel?.font = .h4
        loginOptionsButton.setTitle(Strings.loginWithOtherOptions, for: .normal)
        
        continueAsGuestButton.type = .simple
        continueAsGuestButton.titleLabel?.font = .h5
        continueAsGuestButton.setTitle(Strings.continueAsGuest, for: .normal)
        
        languageButton.type = .custom(textColor: .darkText,
                                      bgColor: .clear,
                                      cornerRadius: 0.0,
                                      borderColor: nil,
                                      margin: 0.0)
        languageButton.titleLabel?.font = .h6
        
        viewModel?.loginEntry.bind({ [weak self] entry in
            self?.loginEntry = entry
        })
    }
    
    func getMobileNumberEntryField() -> UIView {
        let model = LoginEntryFieldModel(useCases: nil, actions: nil)
        let textFieldLoginEntry = LoginEntryField.instance(withModel: model)
        
        return textFieldLoginEntry
    }
    
    func getFaceIDLoginEntry() -> UIView {
        let model = LoginEntryFaceIDModel(useCases: nil, actions: nil)
        let faceIDLoginEntry = LoginEntryFaceID.instance(withModel: model)
        
        return faceIDLoginEntry
    }
}


extension OTPLoginViewController {
    @IBAction func languageButtonTapped() {
        loginEntry = .mobileNumber
    }
    
    @IBAction func loginOptionsButtonTapped() {
        viewModel?.showLoginOptions()
    }
}
