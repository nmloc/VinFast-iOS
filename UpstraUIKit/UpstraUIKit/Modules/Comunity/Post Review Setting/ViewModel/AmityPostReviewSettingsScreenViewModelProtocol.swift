//
//  AmityPostReviewSettingsScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

enum AmityPostReviewSettingsAction {
    case showMenu(settingItem: [AmitySettingsItem])
    case turnOnApproveMemberPost(content: AmitySettingsItem.ToggleContent)
    case turnOffApproveMemberPost(content: AmitySettingsItem.ToggleContent)
}


protocol AmityPostReviewSettingsScreenViewModelDelegate: AnyObject {
    func screenViewModel(_ viewModel: AmityPostReviewSettingsScreenViewModelType, didFinishWithAction action: AmityPostReviewSettingsAction)
    func screenViewModel(_ viewModel: AmityPostReviewSettingsScreenViewModelType, didFailWithAction action: AmityPostReviewSettingsAction)
    func screenViewModel(_ viewModel: AmityPostReviewSettingsScreenViewModelType, didFailWithError error: AmityError)
}

protocol AmityPostReviewSettingsScreenViewModelDataSource {
    var communityId: String { get }
}

protocol AmityPostReviewSettingsScreenViewModelAction {
    func getCommunity()
    func turnOffApproveMemberPost(content: AmitySettingsItem.ToggleContent)
    func turnOnApproveMemberPost(content: AmitySettingsItem.ToggleContent)
}

protocol AmityPostReviewSettingsScreenViewModelType: AmityPostReviewSettingsScreenViewModelAction, AmityPostReviewSettingsScreenViewModelDataSource {
    var delegate: AmityPostReviewSettingsScreenViewModelDelegate? { get set }
    var action: AmityPostReviewSettingsScreenViewModelAction { get }
    var dataSource: AmityPostReviewSettingsScreenViewModelDataSource { get }
}

extension AmityPostReviewSettingsScreenViewModelType {
    var action: AmityPostReviewSettingsScreenViewModelAction { return self }
    var dataSource: AmityPostReviewSettingsScreenViewModelDataSource { return self }
}
