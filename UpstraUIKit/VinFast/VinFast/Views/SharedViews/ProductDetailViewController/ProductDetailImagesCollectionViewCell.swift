//
//  CategoryCollectionViewCell.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 16/04/2023.
//

import UIKit

class ProductDetailImagesCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.heightAnchor.constraint(equalToConstant: imageView.bounds.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageView.bounds.width).isActive = true
        imageView.contentMode = .scaleAspectFit
        self.layer.cornerRadius = 8.0
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(image: String) {
        imageView.image = UIImage(named: image)!.withRenderingMode(.alwaysOriginal)
    }
}
