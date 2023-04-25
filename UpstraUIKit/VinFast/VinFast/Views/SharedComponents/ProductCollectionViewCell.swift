//
//  CategoryCollectionViewCell.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 16/04/2023.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productRateImageView: UIImageView!
    @IBOutlet weak var productRateLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func setup(item: ProductModel) {
        productImageView.image = UIImage(named: item.image)
        productNameLabel.text = item.name
        productRateLabel.text = item.rate
        productPriceLabel.text = item.price
        
        let rate = Double(item.rate)
        switch true {
        case rate == 5:
            productRateImageView.image = configImage(named: "star.fill")
        case rate == 0:
            productRateImageView.image = configImage(named: "star")
        case rate! < 5 && rate! > 0:
            productRateImageView.image = configImage(named: "star.leadinghalf.filled")
        default:
            productRateImageView.image = configImage(named: "star.fill")
        }
        
        // Set the width and height of the productImageView
        productImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width).isActive = true
//        productImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height - 63).isActive = true
    }
    
    func configImage(named: String) -> UIImage {
        return UIImage(systemName: named, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))!.withTintColor(.white, renderingMode: .alwaysOriginal)
    }
}
