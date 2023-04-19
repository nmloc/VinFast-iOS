//
//  AmityFeedDataSource.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

/// This protocol for providing to custom post
public protocol AmityFeedDataSource: AnyObject {
    func getUIComponentForPost(post: AmityPostModel, at index: Int) -> AmityPostComposable?
}


