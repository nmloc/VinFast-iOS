//
//  AmityPostUpdateController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityPostUpdateControllerProtocol {
    func update(withPostId postId: String, text: String, completion: AmityPostRequestCompletion?)
}

final class AmityPostUpdateController: AmityPostUpdateControllerProtocol {
    private let repository = AmityPostRepository(client: AmityUIKitManagerInternal.shared.client)
    
    func update(withPostId postId: String, text: String, completion: AmityPostRequestCompletion?) {
        let textBuilder = AmityTextPostBuilder()
        textBuilder.setText(text)
        repository.updatePost(withId: postId, builder: textBuilder, completion: completion)
    }
    
}
