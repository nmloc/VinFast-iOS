//
//  AmityPendingPostsDetailScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityPendingPostsDetailScreenViewModelDelegate: AnyObject {
    func screenViewModel(_ viewModel: AmityPendingPostsDetailScreenViewModelType, didGetMemberStatusCommunity status: AmityMemberStatusCommunity)
    func screenViewModelDidGetPost(_ viewModel: AmityPendingPostsDetailScreenViewModelType)
    func screenViewModelDidDeletePostFinish()
    func screenViewModelDidDeletePostFail(title: String, message: String)
    
    func screenViewModelDidApproveOrDeclinePost()
}

protocol AmityPendingPostsDetailScreenViewModelDataSource {
    var memberStatusCommunity: AmityMemberStatusCommunity { get }
    
    func numberOfPostComponents() -> Int
    func postComponents(at indexPath: IndexPath) -> AmityPostComponent?
}

protocol AmityPendingPostsDetailScreenViewModelAction {
    func getMemberStatus()
    func getPost()
    
    func approvePost()
    func declinePost()
    func deletePost()
}

protocol AmityPendingPostsDetailScreenViewModelType: AmityPendingPostsDetailScreenViewModelAction, AmityPendingPostsDetailScreenViewModelDataSource {
    var delegate: AmityPendingPostsDetailScreenViewModelDelegate? { get set }
    var action: AmityPendingPostsDetailScreenViewModelAction { get }
    var dataSource: AmityPendingPostsDetailScreenViewModelDataSource { get }
}

extension AmityPendingPostsDetailScreenViewModelType {
    var action: AmityPendingPostsDetailScreenViewModelAction { return self }
    var dataSource: AmityPendingPostsDetailScreenViewModelDataSource { return self }
}

