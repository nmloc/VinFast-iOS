//
//  AmityCommunitySearchScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityCommunitySearchScreenViewModelDelegate: AnyObject {
    func screenViewModelDidSearch(_ viewModel: AmityCommunitySearchScreenViewModelType)
    func screenViewModelDidClearText(_ viewModel: AmityCommunitySearchScreenViewModelType)
    func screenViewModelDidSearchNotFound(_ viewModel: AmityCommunitySearchScreenViewModelType)
    func screenViewModel(_ viewModel: AmityCommunitySearchScreenViewModelType, loadingState: AmityLoadingState)
}

protocol AmityCommunitySearchScreenViewModelDataSource {
    func numberOfCommunity() -> Int
    func item(at indexPath: IndexPath) -> AmityCommunityModel?
}

protocol AmityCommunitySearchScreenViewModelAction {
    func search(withText text: String?)
    func loadMore()
}

protocol AmityCommunitySearchScreenViewModelType: AmityCommunitySearchScreenViewModelAction, AmityCommunitySearchScreenViewModelDataSource {
    var delegate: AmityCommunitySearchScreenViewModelDelegate? { get set }
    var action: AmityCommunitySearchScreenViewModelAction { get }
    var dataSource: AmityCommunitySearchScreenViewModelDataSource { get }
}

extension AmityCommunitySearchScreenViewModelType {
    var action: AmityCommunitySearchScreenViewModelAction { return self }
    var dataSource: AmityCommunitySearchScreenViewModelDataSource { return self }
}
