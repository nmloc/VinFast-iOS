//
//  AmityBadgeView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

final class AmityBadgeView: AmityView {
    
    // MARK: - IBOutlet Properties
    @IBOutlet private var badgeView: UIView!
    @IBOutlet private var label: UILabel!
    
    // MARK: - Properties
    var badge: Int = 0 {
        didSet {
            isHidden = badge <= 0
            label.text = "\(badge)"
            badgeView.layer.cornerRadius = badgeView.frame.height / 2
        }
    }
    
    override func initial() {
        loadNibContent()
        setupView()
    }
    
    private func setupView() {
        badgeView.backgroundColor = AmityColorSet.alert
        
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = AmityFontSet.caption
    }
    
}
