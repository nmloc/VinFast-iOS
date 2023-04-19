//
//  AmityPostReviewSettingsItem.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

enum AmityPostReviewSettingsItem: String {
    case approveMemberPost
    
    var identifier: String {
        return String(describing: self)
    }
    
    var title: String {
        switch self {
        case .approveMemberPost:
            return AmityLocalizedStringSet.PostReviewSettings.itemTitleApproveMemberPosts.localizedString
        }
    }
    
    var description: String? {
        switch self {
        case .approveMemberPost:
            return AmityLocalizedStringSet.PostReviewSettings.itemDescApproveMemberPosts.localizedString
        }
    }
    
    var icon: UIImage? {
        return nil
    }
}
