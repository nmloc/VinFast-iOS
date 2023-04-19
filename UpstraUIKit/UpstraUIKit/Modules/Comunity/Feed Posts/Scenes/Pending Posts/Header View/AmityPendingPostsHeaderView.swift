//
//  AmityPendingPostsHeaderView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityPendingPostsHeaderView: AmityView {

    @IBOutlet private var titleLabel: UILabel!
    
    override func initial() {
        loadNibContent()
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.text = AmityLocalizedStringSet.PendingPosts.headerTitle.localizedString
        titleLabel.font = AmityFontSet.caption
        titleLabel.textColor = AmityColorSet.base.blend(.shade1)
        titleLabel.numberOfLines = 0
    }
}
