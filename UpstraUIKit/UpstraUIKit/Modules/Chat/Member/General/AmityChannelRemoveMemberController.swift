//
//  AmityChannelRemoveMemberController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit
import AmitySDK

protocol AmityChannelRemoveMemberControllerProtocol {
    func remove(users: [AmityChannelMembershipModel], at indexPath: IndexPath, _ completion: @escaping (AmityError?) -> Void)
}

final class AmityChannelRemoveMemberController: AmityChannelRemoveMemberControllerProtocol {
    
    private var membershipParticipation: AmityChannelParticipation?
    
    init(channelId: String) {
        membershipParticipation = AmityChannelParticipation(client: AmityUIKitManagerInternal.shared.client, andChannel: channelId)
    }
    
    func remove(users: [AmityChannelMembershipModel], at indexPath: IndexPath, _ completion: @escaping (AmityError?) -> Void) {
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
