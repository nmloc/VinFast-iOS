//
//  AmityPostPlaceHolderTableViewCell.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityPostPlaceHolderTableViewCell: UITableViewCell, Nibbable {

    // MARK: - IBOutlet Properties
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var heightConstaint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.backgroundColor = AmityColorSet.backgroundColor
        heightConstaint.constant = UIScreen.main.bounds.width
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = AmityLocalizedStringSet.Post.placeholderTitle.localizedString
        titleLabel.textColor = AmityColorSet.base.blend(.shade3)
        titleLabel.font = AmityFontSet.title
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = AmityLocalizedStringSet.Post.placeholderDesc.localizedString
        descriptionLabel.textColor = AmityColorSet.base.blend(.shade3)
        descriptionLabel.font = AmityFontSet.caption
    }
}
