//
//  AmityTrendingCommunityScreenViewModel.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityTrendingCommunityScreenViewModel: AmityTrendingCommunityScreenViewModelType {
    
    weak var delegate: AmityTrendingCommunityScreenViewModelDelegate?
    
    // MARK: - Controller
    private let trendingController: AmityCommunityTrendingControllerProtocol
    
    // MARK: - Properties
    private var communities: [AmityCommunityModel] = []
    private let debouncer = Debouncer(delay: 0.3)
    
    init(trendingController: AmityCommunityTrendingControllerProtocol) {
        self.trendingController = trendingController
    }
    
}

// MARK: - DataSource {
extension AmityTrendingCommunityScreenViewModel {
    
    func numberOfTrending() -> Int {
        return communities.count
    }
    
    func community(at indexPath: IndexPath) -> AmityCommunityModel {
        return communities[indexPath.row]
    }

}

// MARK: - Action
extension AmityTrendingCommunityScreenViewModel {
    func retrieveTrending() {
        trendingController.retrieve { [weak self] result in
            self?.debouncer.run {
                guard let strongSelf = self else { return }
                switch result {
                case .success(let community):
                    strongSelf.communities = community
                    strongSelf.delegate?.screenViewModel(strongSelf, didRetrieveTrending: community, isEmpty: community.isEmpty)
                case .failure(let error):
                    strongSelf.delegate?.screenViewModel(strongSelf, didFail: error)
                }
            }
        }
    }

}
