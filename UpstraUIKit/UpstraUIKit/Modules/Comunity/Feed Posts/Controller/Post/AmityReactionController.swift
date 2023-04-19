//
//  AmityReactionController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmitySDK

public enum AmityReactionType: String {
    case like
}

protocol AmityReactionControllerProtocol {
    func addReaction(withReaction reaction: AmityReactionType, referanceId: String, referenceType: AmityReactionReferenceType, completion: AmityRequestCompletion?)
    func removeReaction(withReaction reaction: AmityReactionType, referanceId: String, referenceType: AmityReactionReferenceType, completion: AmityRequestCompletion?)
}

final class AmityReactionController: AmityReactionControllerProtocol {
    
    private let repository = AmityReactionRepository(client: AmityUIKitManagerInternal.shared.client)

    func addReaction(withReaction reaction: AmityReactionType, referanceId: String, referenceType: AmityReactionReferenceType, completion: AmityRequestCompletion?) {
        repository.addReaction(reaction.rawValue, referenceId: referanceId, referenceType: referenceType, completion: completion)
    }
    
    func removeReaction(withReaction reaction: AmityReactionType, referanceId: String, referenceType: AmityReactionReferenceType, completion: AmityRequestCompletion?) {
        repository.removeReaction(reaction.rawValue, referenceId: referanceId, referenceType: referenceType, completion: completion)
    }
}
