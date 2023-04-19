//
//  AmityCommentFlaggerController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

protocol AmityCommentFlaggerControllerProtocol {
    func report(withCommentId commentId: String, completion: AmityRequestCompletion?)
    func unreport(withCommentId commentId: String, completion: AmityRequestCompletion?)
    func getReportStatus(withCommentId commentId: String, completion: ((Bool) -> Void)?)
}

final class AmityCommentFlaggerController: AmityCommentFlaggerControllerProtocol {
    
    private var flagger: AmityCommentFlagger?
    
    func report(withCommentId commentId: String, completion: AmityRequestCompletion?) {
        flagger = AmityCommentFlagger(client: AmityUIKitManagerInternal.shared.client, commentId: commentId)
        flagger?.flag(completion: completion)
    }
    
    func unreport(withCommentId commentId: String, completion: AmityRequestCompletion?) {
        flagger = AmityCommentFlagger(client: AmityUIKitManagerInternal.shared.client, commentId: commentId)
        flagger?.unflag(completion: completion)
    }
    
    func getReportStatus(withCommentId commentId: String, completion: ((Bool) -> Void)?) {
        flagger = AmityCommentFlagger(client: AmityUIKitManagerInternal.shared.client, commentId: commentId)
        flagger?.isFlaggedByMe { flag in
            completion?(flag)
        }
    }
}
