//
//  Dummy.swift
//  EtisalatUAE
//
//  Created by Ali Amin on 27/04/2022.
//  Copyright © 2022 Etisalat. All rights reserved.
//

import Foundation
import UIKit


@objc class Dummy: NSObject {
    @objc func startFlow(witgWindow window: UIWindow) {
        let window = UIApplication.shared.windows.first!
        let input = OTPLoginCoordinatorInput(window: window) { selectedLoginOption in
            
        }
        let actions = OTPLoginCoordinatorActions(presentLoginOptions: { presentingViewController in
            let actions = OTPLoginOptionsCoordinatorActions { selectedLoginOption in
                //otpLoginCoordinator.input.otpLoginOptionIsSelected(selectedLoginOption)
            }
            let input = OTPLoginOptionsCoordinatorInput(presentingViewController: presentingViewController)
            let OTPLoginOptionsCoordinator = OTPLoginOptionsCoordinator(input: input,
                                                                        actions: actions)
            OTPLoginOptionsCoordinator.start()
        })
        let otpLoginCoordinator = OTPLoginCoordinator(input: input, actions: actions)
        
        otpLoginCoordinator.start()
    }
}
