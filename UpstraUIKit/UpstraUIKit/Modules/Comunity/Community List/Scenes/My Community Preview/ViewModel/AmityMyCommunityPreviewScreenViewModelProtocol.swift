//
//  AmityMyCommunityPreviewScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityMyCommunityPreviewScreenViewModelDelegate: AnyObject {
    func screenViewModel(_ viewModel: AmityMyCommunityPreviewScreenViewModelType, didRetrieveCommunityList communityList: [AmityCommunityModel])
}

protocol AmityMyCommunityPreviewScreenViewModelDataSource {
    func numberOfCommunity() -> Int
    func item(at indexPath: IndexPath) -> AmityCommunityModel
}

protocol AmityMyCommunityPreviewScreenViewModelAction {
    func retrieveMyCommunityList()
    
    func shouldShowSeeAll(indexPath: IndexPath) -> Bool
}

protocol AmityMyCommunityPreviewScreenViewModelType: AmityMyCommunityPreviewScreenViewModelAction, AmityMyCommunityPreviewScreenViewModelDataSource {
    var delegate: AmityMyCommunityPreviewScreenViewModelDelegate? { get set }
    var action: AmityMyCommunityPreviewScreenViewModelAction { get }
    var dataSource: AmityMyCommunityPreviewScreenViewModelDataSource { get }
}

extension AmityMyCommunityPreviewScreenViewModelType {
    var action: AmityMyCommunityPreviewScreenViewModelAction { return self }
    var dataSource: AmityMyCommunityPreviewScreenViewModelDataSource { return self }
}
