//
//  AmityRecentChatScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityRecentChatScreenViewModelDelegate: AnyObject {
    func screenViewModelDidGetChannel()
    func screenViewModelLoadingState(for state: AmityLoadingState)
    func screenViewModelRoute(for route: AmityRecentChatScreenViewModel.Route)
    func screenViewModelEmptyView(isEmpty: Bool)
    func screenViewModelDidCreateCommunity(channelId: String, subChannelId: String)
    func screenViewModelDidFailedCreateCommunity(error: String)
}

protocol AmityRecentChatScreenViewModelDataSource {
    
    func channel(at indexPath: IndexPath) -> AmityChannelModel
    func numberOfRow(in section: Int) -> Int
    func isAddMemberBarButtonEnabled() -> Bool
}

protocol AmityRecentChatScreenViewModelAction {
    func viewDidLoad()
    func join(at indexPath: IndexPath)
    func createChannel(users: [AmitySelectMemberModel])
    func loadMore()
}

protocol AmityRecentChatScreenViewModelType: AmityRecentChatScreenViewModelAction, AmityRecentChatScreenViewModelDataSource {
    var action: AmityRecentChatScreenViewModelAction { get }
    var dataSource: AmityRecentChatScreenViewModelDataSource { get }
    var delegate: AmityRecentChatScreenViewModelDelegate? { get set }
}

extension AmityRecentChatScreenViewModelType {
    var action: AmityRecentChatScreenViewModelAction { return self }
    var dataSource: AmityRecentChatScreenViewModelDataSource { return self }
}
