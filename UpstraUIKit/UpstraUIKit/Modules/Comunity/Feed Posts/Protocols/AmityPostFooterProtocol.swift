//
//  AmityPostFooterProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

/// A default protocol of footer post
public protocol AmityPostFooterProtocol: UITableViewCell, AmityCellIdentifiable {
    var delegate: AmityPostFooterDelegate? { get set }
    var post: AmityPostModel? { get }
    
    func display(post: AmityPostModel)
}

/// A default delegate of footer post
public protocol AmityPostFooterDelegate: AnyObject {
    func didPerformAction(_ cell: AmityPostFooterProtocol, action: AmityPostFooterAction)
}

/// A default action of footer post
public enum AmityPostFooterAction {
    case tapLike
    case tapComment
    case tapShare
}
