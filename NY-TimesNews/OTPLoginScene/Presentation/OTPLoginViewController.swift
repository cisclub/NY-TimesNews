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
    @IBOutlet private var headerLabel: BaseLabel!
    @IBOutlet private var bodyLabel: BaseLabel!
    @IBOutlet private var loginButton: BaseButton!
    @IBOutlet private var loginOptionsButton: BaseButton!
    @IBOutlet private var continueAsGuestButton: BaseButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.type = .title
        bodyLabel.type = .subtitle
        
        headerLabel.text = Strings.loginToMyEtisalat
        bodyLabel.text = Strings.UAEPassSubtitle
        
        loginButton.type = .disabled
        loginButton.titleLabel?.font = .h4
        loginButton.setTitle(Strings.login, for: .normal)
        
        loginOptionsButton.type = .greenBordered
        loginOptionsButton.titleLabel?.font = .h4
        loginOptionsButton.setTitle(Strings.loginWithOtherOptions, for: .normal)
        
        continueAsGuestButton.type = .simple
        continueAsGuestButton.setTitle(Strings.continueAsGuest, for: .normal)
    }
}


extension OTPLoginViewController {
    @IBAction func loginOptionsButtonTapped() {
        viewModel.showLoginOptions()
    }
}
