//
//  LinkedAccountCell.swift
//  NY-TimesNews
//
//  Created by Ali Amin on 10/05/2022.
//

import Foundation


class LinkedAccountCell: StandardCell {
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: BaseLabel!
    @IBOutlet private var descriptionLabel: BaseLabel!
    @IBOutlet private var separator: UIView!
    @IBOutlet private var primaryLabel: BaseLabel!
    @IBOutlet private var tickImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separator.backgroundColor = UIColor.separator
        primaryLabel.text = "   \(Strings.primary)   "
        primaryLabel.fullyRoundCorners()
        primaryLabel.backgroundColor = .mainThemeColor
        primaryLabel.type = .h6
        
        profileImageView.roundCorners(withRadius: 12)
        profileImageView.clipsToBounds = true
    }
    
    
    override func updateUITONormalState() {
        super.updateUITONormalState()
        
        nameLabel.type = .h4
        descriptionLabel.type = .subtitle
        primaryLabel.isHidden = true
        tickImageView.isHidden = true
        
        if let model = viewModel as? LinkedAccountCellModel {
            profileImageView.image = model.profileImage
            nameLabel.text = model.name
            descriptionLabel.text = model.description
        }
    }
    
    override func updateUITOSelectedState() {
        super.updateUITOSelectedState()
        
        nameLabel.type = .h4Active
        descriptionLabel.type = .subtitleActive
        primaryLabel.isHidden = false
        tickImageView.isHidden = false
    }
}
