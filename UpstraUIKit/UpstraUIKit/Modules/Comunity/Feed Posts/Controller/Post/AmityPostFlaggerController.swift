//
//  AmityPostFlaggerController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityPostFlaggerControllerProtocol {
    func report(withPostId postId: String, completion: AmityRequestCompletion?)
    func unreport(withPostId postId: String, completion: AmityRequestCompletion?)
    func getReportStatus(withPostId postId: String, completion: ((Bool) -> Void)?)
}

final class AmityPostFlaggerController: AmityPostFlaggerControllerProtocol {
    private var flagger: AmityPostFlagger?
    
    func report(withPostId postId: String, completion: AmityRequestCompletion?) {
        flagger = AmityPostFlagger(client: AmityUIKitManagerInternal.shared.client, postId: postId)
        flagger?.flagPost(completion: completion)
    }
    
    func unreport(withPostId postId: String, completion: AmityRequestCompletion?) {
        flagger = AmityPostFlagger(client: AmityUIKitManagerInternal.shared.client, postId: postId)
        flagger?.unflagPost(completion: completion)
    }
    
    func getReportStatus(withPostId postId: String, completion: ((Bool) -> Void)?) {
        flagger = AmityPostFlagger(client: AmityUIKitManagerInternal.shared.client, postId: postId)
        flagger?.isPostFlaggedByMe { (flag) in
            completion?(flag)
        }
    }
}
