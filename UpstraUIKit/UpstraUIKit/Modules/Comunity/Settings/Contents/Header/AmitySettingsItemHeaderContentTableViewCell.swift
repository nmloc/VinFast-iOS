//
//  AmitySettingsItemHeaderContentTableViewCell.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmitySettingsItemHeaderCellProtocol {
    func display(content: AmitySettingsItem.HeaderContent)
}

final class AmitySettingsItemHeaderContentTableViewCell: UITableViewCell, Nibbable, AmitySettingsItemHeaderCellProtocol {

    // MARK: - IBOutlet Properties
    @IBOutlet private var titleLabel: AmityLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = AmityLocalizedStringSet.titlePlaceholder
    }
    
    func display(content: AmitySettingsItem.HeaderContent) {
        titleLabel.text = content.title
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = AmityColorSet.backgroundColor
        contentView.backgroundColor = AmityColorSet.backgroundColor
        
        // MARK: - Title
        titleLabel.text = AmityLocalizedStringSet.titlePlaceholder
        titleLabel.font = AmityFontSet.title
        titleLabel.textColor = AmityColorSet.base
    }
}
