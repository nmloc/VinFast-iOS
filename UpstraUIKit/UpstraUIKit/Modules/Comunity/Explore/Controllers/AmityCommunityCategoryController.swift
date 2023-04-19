//
//  AmityCommunityCategoryController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityCommunityCategoryControllerProtocol {
    func retrieve(_ completion: ((Result<[AmityCommunityCategoryModel], AmityError>) -> Void)?)
}

final class AmityCommunityCategoryController: AmityCommunityCategoryControllerProtocol {
    
    private let repository = AmityCommunityRepository(client: AmityUIKitManagerInternal.shared.client)
    private var collection: AmityCollection<AmityCommunityCategory>?
    private var token: AmityNotificationToken?
    private let maxCategories: UInt = 8
    
    func retrieve(_ completion: ((Result<[AmityCommunityCategoryModel], AmityError>) -> Void)?) {
        collection = repository.getCategories(sortBy: .displayName, includeDeleted: false)
        token = collection?.observe { [weak self] (collection, change, error) in
            if collection.dataStatus == .fresh {
                guard let strongSelf = self else { return }
                if let error = AmityError(error: error) {
                    completion?(.failure(error))
                } else {
                    completion?(.success(strongSelf.prepareDataSource()))
                }
            } else {
                completion?(.failure(AmityError(error: error) ?? .unknown))
            }
        }
    }
    
    private func prepareDataSource() -> [AmityCommunityCategoryModel] {
        guard let collection = collection else { return [] }
        var category: [AmityCommunityCategoryModel] = []
        for index in 0..<min(collection.count(), Int(maxCategories)) {
            guard let object = collection.object(at: index) else { continue }
            let model = AmityCommunityCategoryModel(object: object)
            category.append(model)
        }
        return category
    }

}
