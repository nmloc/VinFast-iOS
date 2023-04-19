//
//  AmitySearchEmptyView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmitySearchEmptyView: AmityView {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var topConstrant: NSLayoutConstraint!
    
    var topMargin: CGFloat = 20 {
        didSet {
            topConstrant.constant = topMargin
        }
    }
    
    override func initial() {
        loadNibContent()
        setupView()
    }
    
    private func setupView() {
        titleLabel.text = AmityLocalizedStringSet.searchResultNotFound.localizedString
        titleLabel.textColor = AmityColorSet.base.blend(.shade3)
        titleLabel.font = AmityFontSet.title
        titleLabel.textAlignment = .center
    }
}
