//
//  AmityCommunityProfileScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

enum AmityCommunityProfileRoute {
    case post
    case member
    case settings
    case editProfile
    case pendingPosts
}

protocol AmityCommunityProfileScreenViewModelDelegate: AnyObject {
    func screenViewModelDidGetCommunity(with community: AmityCommunityModel)
    func screenViewModelFailure()
    func screenViewModelRoute(_ viewModel: AmityCommunityProfileScreenViewModel, route: AmityCommunityProfileRoute)
}

protocol AmityCommunityProfileScreenViewModelDataSource {
    var communityId: String { get }
    var community: AmityCommunityModel? { get }
    var memberStatusCommunity: AmityMemberStatusCommunity { get }
    var postCount: Int { get }
}

protocol AmityCommunityProfileScreenViewModelAction {
    func retriveCommunity()
    func getPendingPostCount(completion: ((Int) -> Void)?)
    func joinCommunity()
    
    func route(_ route: AmityCommunityProfileRoute)
}

protocol AmityCommunityProfileScreenViewModelType: AmityCommunityProfileScreenViewModelAction, AmityCommunityProfileScreenViewModelDataSource {
    var delegate: AmityCommunityProfileScreenViewModelDelegate? { get set }
    var action: AmityCommunityProfileScreenViewModelAction { get }
    var dataSource: AmityCommunityProfileScreenViewModelDataSource { get }
}

extension AmityCommunityProfileScreenViewModelType {
    var action: AmityCommunityProfileScreenViewModelAction { return self }
    var dataSource: AmityCommunityProfileScreenViewModelDataSource { return self }
}
