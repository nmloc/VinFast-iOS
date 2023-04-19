//
//  AmityCommunitySettingsScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityCommunitySettingsScreenViewModelDelegate: AnyObject {
    func screenViewModel(_ viewModel: AmityCommunitySettingsScreenViewModelType, didGetSettingMenu settings: [AmitySettingsItem])
    func screenViewModel(_ viewModel: AmityCommunitySettingsScreenViewModelType, didGetCommunitySuccess community: AmityCommunityModel)
    func screenViewModelDidLeaveCommunity()
    func screenViewModelDidCloseCommunity()
    func screenViewModelDidLeaveCommunityFail()
    func screenViewModelDidCloseCommunityFail()
    func screenViewModel(_ viewModel: AmityCommunitySettingsScreenViewModelType, failure error: AmityError)
}

protocol AmityCommunitySettingsScreenViewModelDataSource {
    var community: AmityCommunityModel? { get }
    var communityId: String { get }
    func isModerator(userId: String) -> Bool
}

protocol AmityCommunitySettingsScreenViewModelAction {
    func retrieveSettingsMenu()
    func retrieveCommunity()
    func retrieveNotifcationSettings()
    func leaveCommunity()
    func closeCommunity()
}

protocol AmityCommunitySettingsScreenViewModelType: AmityCommunitySettingsScreenViewModelAction, AmityCommunitySettingsScreenViewModelDataSource {
    var delegate: AmityCommunitySettingsScreenViewModelDelegate? { get set }
    var action: AmityCommunitySettingsScreenViewModelAction { get }
    var dataSource: AmityCommunitySettingsScreenViewModelDataSource { get }
}

extension AmityCommunitySettingsScreenViewModelType {
    var action: AmityCommunitySettingsScreenViewModelAction { return self }
    var dataSource: AmityCommunitySettingsScreenViewModelDataSource { return self }
}
