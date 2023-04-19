//
//  AmityCommunityMemberSettingsScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityCommunityMemberSettingsScreenViewModelDelegate: AnyObject {
    func screenViewModelShouldShowAddButtonBarItem(status: Bool)
}

protocol AmityCommunityMemberSettingsScreenViewModelDataSource {
    var community: AmityCommunityModel { get }
    var isModerator: Bool { get }
    var shouldShowAddMemberButton: Bool { get }
}

protocol AmityCommunityMemberSettingsScreenViewModelAction {
    func getUserRoles()
}

protocol AmityCommunityMemberSettingsScreenViewModelType: AmityCommunityMemberSettingsScreenViewModelAction, AmityCommunityMemberSettingsScreenViewModelDataSource {
    var delegate: AmityCommunityMemberSettingsScreenViewModelDelegate? { get set }
    var action: AmityCommunityMemberSettingsScreenViewModelAction { get }
    var dataSource: AmityCommunityMemberSettingsScreenViewModelDataSource { get }
}

extension AmityCommunityMemberSettingsScreenViewModelType {
    var action: AmityCommunityMemberSettingsScreenViewModelAction { return self }
    var dataSource: AmityCommunityMemberSettingsScreenViewModelDataSource { return self }
}
