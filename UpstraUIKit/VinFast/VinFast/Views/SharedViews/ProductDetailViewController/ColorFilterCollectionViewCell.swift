//
//  CategoryCollectionViewCell.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 16/04/2023.
//

import UIKit

class ColorFilterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var checkmarkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        checkmarkImageView.isHidden = true
        self.layer.cornerRadius = self.bounds.height / 2.0
        
    }
    
    func setup(color: String) {
        self.backgroundColor = color.toHex.toUIColor()
    }
}
