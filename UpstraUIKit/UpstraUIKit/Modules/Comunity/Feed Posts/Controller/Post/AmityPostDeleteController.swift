//
//  AmityPostDeleteController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityPostDeleteControllerProtocol {
    func delete(withPostId postId: String, parentId: String?, completion: AmityRequestCompletion?)
}

final class AmityPostDeleteController: AmityPostDeleteControllerProtocol {
    private let repository = AmityPostRepository(client: AmityUIKitManagerInternal.shared.client)
    
    func delete(withPostId postId: String, parentId: String?, completion: AmityRequestCompletion?) {
        repository.deletePost(withId: postId, parentId: parentId, hardDelete: false, completion: completion)
    }
}
