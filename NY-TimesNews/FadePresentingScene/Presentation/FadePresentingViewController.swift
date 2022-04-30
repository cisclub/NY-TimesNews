//
//  
//  FadePresentingViewController.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 30/04/2022.
//
//


import UIKit


class FadePresentingViewController: StandardViewController<FadePresentingViewModel> {
    @IBOutlet var fadeView: UIView!
    var finalAlpha = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedToDismiss))
        fadeView.addGestureRecognizer(tapGesture)
        
        view.backgroundColor = .clear
        view.isOpaque = false
        fadeView.backgroundColor = SWThemeManager.themeSemiTransparantBlackColor() // TODO: Replace with New ThemeManager
        fadeView.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.9) {
            self.fadeView.alpha = self.finalAlpha
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.05) {
            self.fadeView.alpha = 0.0
        }
    }
}


// MAR: Actions
extension FadePresentingViewController {
    @objc func tappedToDismiss() {
        viewModel.actions.handleCancelAction()
    }
}
