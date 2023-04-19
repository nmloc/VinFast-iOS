//
//  AmityMessageDateView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

class AmityMessageDateView: AmityView {
    
    // MARK: - IBOutlet Properties
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var dateLabel: UILabel!
    
    // MARK: - Properties
    var text: String? {
        didSet {
            dateLabel.text = text
        }
    }
    
    override func initial() {
        loadNibContent()
        setupView()
    }

    private func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        containerView.backgroundColor = AmityColorSet.secondary.blend(.shade4)
        containerView.layer.cornerRadius = containerView.frame.height / 2
        
        dateLabel.textColor = AmityColorSet.base
        dateLabel.font = AmityFontSet.caption
        
    }
    
}
