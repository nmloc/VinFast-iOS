//
//  AmityEmptyView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

class AmityEmptyView: AmityView {

    // MARK: - IBOutlet Properties
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    override func initial() {
        loadNibContent()
        setupView()
    }
    
    private func setupView() {
        contentView.backgroundColor = AmityColorSet.backgroundColor
        titleLabel.text = ""
        titleLabel.font = AmityFontSet.title
        titleLabel.textColor = AmityColorSet.base.blend(.shade3)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        subtitleLabel.text = ""
        subtitleLabel.font = AmityFontSet.headerLine
        subtitleLabel.textColor = AmityColorSet.base
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
    }
    
    func update(title: String, subtitle: String?,  image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
        imageView.isHidden = image == nil
    }

}
