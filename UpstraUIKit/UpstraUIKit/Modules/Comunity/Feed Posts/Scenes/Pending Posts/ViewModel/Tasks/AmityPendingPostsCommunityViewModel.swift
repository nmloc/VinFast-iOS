//
//  AmityPendingPostsCommunityViewModel.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityPendingPostsCommunityViewModelProtocol {
    func getMemberStatus(_ completion: ((AmityCommunityModel?, AmityMemberStatusCommunity) -> Void)?)
}

final class AmityPendingPostsCommunityViewModel: AmityPendingPostsCommunityViewModelProtocol {
    
    private weak var communityRepository: AmityCommunityRepository?
    private let communityId: String
    
    private var token: AmityNotificationToken?
    private var communityObject: AmityObject<AmityCommunity>?
    
    init(communityId: String,
         communityRepository: AmityCommunityRepository) {
        self.communityId = communityId
        self.communityRepository = communityRepository
    }
    
    func getMemberStatus(_ completion: ((AmityCommunityModel?, AmityMemberStatusCommunity) -> Void)?) {
        var statusMemberOfCommunity: AmityMemberStatusCommunity = .guest
        
        communityObject = communityRepository?.getCommunity(withId: communityId)
        token = communityObject?.observe { [weak self] community, error in
            guard let strongSelf = self else { return }
            if community.dataStatus == .fresh {
                self?.token?.invalidate()
                guard let object = community.object, error == nil else {
                    completion?(nil, statusMemberOfCommunity)
                    return
                }
                
                let model = AmityCommunityModel(object: object)
                AmityUIKitManagerInternal.shared.client.hasPermission(.editCommunity, forCommunity: strongSelf.communityId) { (hasPermission) in
                    if model.isJoined {
                        statusMemberOfCommunity = hasPermission ? .admin : .member
                    } else {
                        statusMemberOfCommunity = .guest
                    }
                    completion?(model, statusMemberOfCommunity)
                }
            }
        }
    }
}
