//
//  AmityPostHeaderProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

/// A default protocol of header post
public protocol AmityPostHeaderProtocol: UITableViewCell, AmityCellIdentifiable {
    var delegate: AmityPostHeaderDelegate? { get set }
    var post: AmityPostModel? { get }
    
    func display(post: AmityPostModel)
}

/// A default delegate of header post
public protocol AmityPostHeaderDelegate: AnyObject {
    func didPerformAction(_ cell: AmityPostHeaderProtocol, action: AmityPostHeaderAction)
}

/// An default action of header post
public enum AmityPostHeaderAction {
    case tapAvatar
    case tapDisplayName
    case tapCommunityName
    case tapOption
}
