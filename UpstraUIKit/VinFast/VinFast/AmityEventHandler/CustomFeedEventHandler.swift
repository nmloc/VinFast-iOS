//
//  CustomFeedEventHandler.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import Foundation
import AmityUIKit

class CustomFeedEventHandler: AmityFeedEventHandler {
    override func sharePostDidTap(from source: AmityViewController, postId: String) {
        let urlString = "https://amity.co/posts/\(postId)"
        guard let url = URL(string: urlString) else { return }
        let viewController = AmityActivityController.make(activityItems: [url])
        source.present(viewController, animated: true, completion: nil)
    }
    
    override func sharePostToGroupDidTap(from source: AmityViewController, postId: String) {
    }
    
    override func sharePostToMyTimelineDidTap(from source: AmityViewController, postId: String) {
    }
}
