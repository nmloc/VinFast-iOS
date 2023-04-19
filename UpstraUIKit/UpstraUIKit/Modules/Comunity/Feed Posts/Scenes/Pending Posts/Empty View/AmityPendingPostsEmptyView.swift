//
//  AmityPendingPostsEmptyView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityPendingPostsEmptyView: AmityView {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!

    override func initial() {
        loadNibContent()
        contentView.backgroundColor = AmityColorSet.backgroundColor
        setupDescriptionLabel()
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = AmityLocalizedStringSet.PendingPosts.emptyTitle.localizedString
        descriptionLabel.font = AmityFontSet.title
        descriptionLabel.textColor = AmityColorSet.base.blend(.shade3)
    }
}
