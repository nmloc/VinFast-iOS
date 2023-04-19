//
//  AmityCommunityUserModeratorController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityCommunityUserRolesControllerProtocol {
    func getUserRoles(withUserId userId: String, role: AmityCommunityRole) -> Bool
}

final class AmityCommunityUserRolesController: AmityCommunityUserRolesControllerProtocol {
    private var membershipParticipation: AmityCommunityParticipation?
    private var membership: AmityCommunityMember?
    
    init(communityId: String) {
        membershipParticipation = AmityCommunityParticipation(client: AmityUIKitManagerInternal.shared.client, andCommunityId: communityId)
    }
    
    func getUserRoles(withUserId userId: String, role: AmityCommunityRole) -> Bool {
        membership = membershipParticipation?.getMember(withId: AmityUIKitManagerInternal.shared.currentUserId)
        guard let roles = membership?.roles as? [String] else { return false }
        return roles.contains(role.rawValue)
    }
}
