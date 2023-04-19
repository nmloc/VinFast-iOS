//
//  AmityCommunityRemoveMemberController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityCommunityRemoveMemberControllerProtocol {
    func remove(users: [AmityCommunityMembershipModel], at indexPath: IndexPath, _ completion: @escaping (AmityError?) -> Void)
}

final class AmityCommunityRemoveMemberController: AmityCommunityRemoveMemberControllerProtocol {
    
    private var membershipParticipation: AmityCommunityParticipation?
    
    init(communityId: String) {
        membershipParticipation = AmityCommunityParticipation(client: AmityUIKitManagerInternal.shared.client, andCommunityId: communityId)
    }
    
    func remove(users: [AmityCommunityMembershipModel], at indexPath: IndexPath, _ completion: @escaping (AmityError?) -> Void) {
        let userId = users[indexPath.row].userId
        membershipParticipation?.removeMembers([userId], completion: { (success, error) in
            if success {
                completion(nil)
            } else {
                completion(AmityError(error: error) ?? .unknown)
            }
        })
    }

}
