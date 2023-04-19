//
//  AmityMyCommunityCollectionViewCell.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityMyCommunityCollectionViewCell: UICollectionViewCell, Nibbable {
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var avatarView: AmityAvatarView!
    @IBOutlet private var displayNameLabel: UILabel!
    @IBOutlet private var badgeImageView: UIImageView!
    @IBOutlet private var privateBadgeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        displayNameLabel.text = ""
        avatarView.image = nil
        privateBadgeImageView.isHidden = true
        badgeImageView.isHidden = true
    }
    
    private func setupView() {
        containerView.backgroundColor = AmityColorSet.backgroundColor
        avatarView.placeholderPostion = .fullSize
        avatarView.placeholder = AmityIconSet.defaultCommunity
        avatarView.contentMode = .scaleAspectFill
        avatarView.isUserInteractionEnabled = false
        displayNameLabel.text = ""
        displayNameLabel.textAlignment = .center
        displayNameLabel.font = AmityFontSet.caption
        displayNameLabel.textColor = AmityColorSet.base
        privateBadgeImageView.image = AmityIconSet.iconPrivate
        privateBadgeImageView.tintColor = AmityColorSet.base
        badgeImageView.image = AmityIconSet.iconBadgeCheckmark
        badgeImageView.tintColor = AmityColorSet.highlight
        badgeImageView.isHidden = true
    }
    
    func display(with community: AmityCommunityModel) {
        displayNameLabel.text = community.displayName
        avatarView.setImage(withImageURL: community.avatarURL, placeholder: AmityIconSet.defaultCommunity)
        badgeImageView.isHidden = !community.isOfficial
        privateBadgeImageView.isHidden = community.isPublic
    }
    
    func setupSeeAll() {
        displayNameLabel.text = AmityLocalizedStringSet.myCommunitySeeAll.localizedString
        avatarView.image = nil
        avatarView.placeholder = AmityIconSet.iconArrowRight
        avatarView.backgroundColor = AmityColorSet.base.blend(.shade4)
        privateBadgeImageView.isHidden = true
    }
}
