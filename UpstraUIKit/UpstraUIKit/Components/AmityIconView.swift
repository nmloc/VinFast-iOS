//
//  AmityIconView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

final class AmityIconView: AmityView {
    
    // MARK: - IBOutlet Properties
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var imageView: UIImageView!
    
    // MARK: - Properties
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var backgroundIcon: UIColor? = AmityColorSet.base.blend(.shade4) {
        didSet {
            containerView.backgroundColor = backgroundIcon
        }
    }
    
    override func initial() {
        loadNibContent()
        setupView()
    }
    
    // MARK: - Setup view
    private func setupView() {
        containerView.backgroundColor = backgroundIcon
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
    }

}
