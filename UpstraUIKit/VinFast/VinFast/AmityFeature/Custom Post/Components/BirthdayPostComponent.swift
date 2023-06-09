//
//  BirthdayPostComponent.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmityUIKit

struct BirthdayPostComponent: AmityPostComposable {
    
    var post: AmityPostModel
    
    init(post: AmityPostModel) {
        self.post = post
    }
    
    
    func getComponentCount(for index: Int) -> Int {
        switch post.appearance.displayType {
        case .feed:
            return 2 + post.maximumLastestComments + post.viewAllCommentSection
        case .postDetail:
            return 2
        @unknown default:
            return 0
        }
    }
    
    func getComponentCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AmityPostBirthdayTableViewCell", for: indexPath) as! AmityPostBirthdayTableViewCell
            cell.display(withPost: post)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AmityPostFooterTableViewCell.cellIdentifier, for: indexPath) as! AmityPostFooterTableViewCell
            cell.display(post: post)
            return cell
        case 2 + post.maximumLastestComments:
            let cell = tableView.dequeueReusableCell(withIdentifier: AmityPostViewAllCommentsTableViewCell.cellIdentifier, for: indexPath) as! AmityPostViewAllCommentsTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AmityPostPreviewCommentTableViewCell.cellIdentifier, for: indexPath) as! AmityPostPreviewCommentTableViewCell
            cell.display(post: post, comment: post.getComment(at: indexPath, totalComponent: 2))
            return cell
        }
        
    }
    
    public func displayCell(_ tableView: UITableView, at indexPath: IndexPath) {
        
    }
    
    func getComponentHeight(indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
