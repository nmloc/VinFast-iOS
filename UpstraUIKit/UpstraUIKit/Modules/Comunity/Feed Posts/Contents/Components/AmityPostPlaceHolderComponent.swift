//
//  AmityPostPlaceHolderComponent.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

struct AmityPostPlaceHolderComponent: AmityPostComposable {
    
    private(set) public var post: AmityPostModel
    
    public init(post: AmityPostModel) {
        self.post = post
    }
    
    public func getComponentCount(for index: Int) -> Int {
        return 1
    }
    
    func getComponentCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: AmityPostPlaceHolderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    public func getComponentHeight(indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
