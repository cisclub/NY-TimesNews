//
//  TextCell.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 11/05/2022.
//

import Foundation


class TextCell: StandardCell {
    @IBOutlet private var contentLabel: BaseLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.type = .subtitle
    }
    
    override func updateUITONormalState() {
        super.updateUITONormalState()
        if let model = viewModel as? TextCellModel {
            contentLabel.attributedText = model.content.styled(as: .body3)
        }
    }
}


class TextCellModel: StandardCellModel {
    let content: String
    
    init(useCases: StandardCellModel.UseCasesType,
                  actions: StandardCellModel.ActionsType,
                  content: String)
    {
        self.content = content
        
        super.init(useCases: useCases, actions: actions)
    }
    
    override func reusableIdentifier() -> String {
        return TextCell.identifier()
    }
}
