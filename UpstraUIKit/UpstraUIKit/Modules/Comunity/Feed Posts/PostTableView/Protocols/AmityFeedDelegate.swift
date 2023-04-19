//
//  AmityFeedDelegate.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

/// This protocol for providing to custom action of header/footer
public protocol AmityFeedDelegate: AnyObject {
    func didPerformActionLikePost()
    func didPerformActionUnLikePost()
    func didPerformActionLikeComment()
    func didPerformActionUnLikeComment()
}
