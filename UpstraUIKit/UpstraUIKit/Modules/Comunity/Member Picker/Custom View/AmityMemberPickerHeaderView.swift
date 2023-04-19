//
//  AmitySelectMemberListHeaderView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityMemberPickerHeaderView: AmityView {
    
    // MARK: - IBOutlet Properties
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: - Properties
    var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    override func initial() {
        loadNibContent()
        setupView()
    }
    
    private func setupView() {
        contentView.backgroundColor = AmityColorSet.secondary.blend(.shade4)
        
        titleLabel.text = ""
        titleLabel.textColor = AmityColorSet.base.blend(.shade3)
        titleLabel.font = AmityFontSet.bodyBold
    }

}
