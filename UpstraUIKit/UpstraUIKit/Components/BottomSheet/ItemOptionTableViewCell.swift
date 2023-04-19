//
//  ItemOptionTableViewCell.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

class ItemOptionTableViewCell: UITableViewCell, Nibbable {

    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageBackgroundView.layer.cornerRadius = 16
        imageBackgroundView.clipsToBounds = true
        imageBackgroundView.isHidden = true
    }
    
}
