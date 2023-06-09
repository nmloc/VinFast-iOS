//
//  AmityCommunityJoinController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityCommunityJoinControllerProtocol {
    func join(_ completion: @escaping (AmityError?) -> Void)
}

final class AmityCommunityJoinController: AmityCommunityJoinControllerProtocol {
    
    private let repository: AmityCommunityRepository
    private let communityId: String
    
    init(withCommunityId _communityId: String) {
        communityId = _communityId
        repository = AmityCommunityRepository(client: AmityUIKitManagerInternal.shared.client)
    }
    
    func join(_ completion: @escaping (AmityError?) -> Void) {
        repository.joinCommunity(withId: communityId) { (success, error) in
            if success {
                completion(nil)
            } else {
                completion(AmityError(error: error) ?? .unknown)
            }
        }
    }
    
}

