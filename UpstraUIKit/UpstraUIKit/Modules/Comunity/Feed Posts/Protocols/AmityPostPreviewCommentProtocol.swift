//
//  AmityPostPreviewCommentProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

public protocol AmityPostPreviewCommentProtocol: UITableViewCell, AmityCellIdentifiable {
    var delegate: AmityPostPreviewCommentDelegate? { get set }
    var post: AmityPostModel? { get }
    
    func display(post: AmityPostModel, comment: AmityCommentModel?)
}

public protocol AmityPostPreviewCommentDelegate: AnyObject {
    func didPerformAction(_ cell: AmityPostPreviewCommentProtocol, action: AmityPostPreviewCommentAction)
}

public enum AmityPostPreviewCommentAction {
    case tapAvatar(comment: AmityCommentModel)
    case tapLike(comment: AmityCommentModel)
    case tapOption(comment: AmityCommentModel)
    case tapReply(comment: AmityCommentModel)
    case tapExpandableLabel(label: AmityExpandableLabel)
    case willExpandExpandableLabel(label: AmityExpandableLabel)
    case didExpandExpandableLabel(label: AmityExpandableLabel)
    case willCollapseExpandableLabel(label: AmityExpandableLabel)
    case didCollapseExpandableLabel(label: AmityExpandableLabel)
    case tapOnMention(userId: String)
}
