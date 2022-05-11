//
//  ButtonCell.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 11/05/2022.
//

import Foundation


class ButtonCell: StandardCell {
    @IBOutlet private var button: BaseButton!
    
    
    @IBAction func buttonTapped() {
        viewModel?.actions?.cellSelected(0, viewModel!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.type = .custom(textColor: .white,
                              bgColor: .mainThemeColor,
                              cornerRadius: button.frame.size.height / 2,
                              borderColor: nil,
                              margin: 0.0)
    }
    
    override func updateUITONormalState() {
        super.updateUITONormalState()
        
        let model = viewModel as! ButtonCellModel
        button.setTitle(model.buttonTitle, for: .normal)
    }
}
