//
//  AmityRecommendedCommunityScreenViewModelProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

protocol AmityRecommendedCommunityScreenViewModelDelegate: AnyObject {
    func screenViewModel(_ viewModel: AmityRecommendedCommunityScreenViewModelType, didRetrieveRecommended recommended: [AmityCommunityModel], isEmpty: Bool)
    func screenViewModel(_ viewModel: AmityRecommendedCommunityScreenViewModelType, didFail error: AmityError)
}

protocol AmityRecommendedCommunityScreenViewModelDataSource {
    func community(at indexPath: IndexPath) -> AmityCommunityModel
    func numberOfRecommended() -> Int
}

protocol AmityRecommendedCommunityScreenViewModelAction {
    func retrieveRecommended()
}

protocol AmityRecommendedCommunityScreenViewModelType: AmityRecommendedCommunityScreenViewModelAction, AmityRecommendedCommunityScreenViewModelDataSource {
    var delegate: AmityRecommendedCommunityScreenViewModelDelegate? { get set }
    var action: AmityRecommendedCommunityScreenViewModelAction { get }
    var dataSource: AmityRecommendedCommunityScreenViewModelDataSource { get }
}

extension AmityRecommendedCommunityScreenViewModelType {
    var action: AmityRecommendedCommunityScreenViewModelAction { return self }
    var dataSource: AmityRecommendedCommunityScreenViewModelDataSource { return self }
}
