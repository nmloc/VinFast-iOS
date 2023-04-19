//
//  AmityPostComposable.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

public protocol AmityPostComposable {
    
    var post: AmityPostModel { get }
    
    // Initialize
    init(post: AmityPostModel)
    
    // Number of components
    func getComponentCount(for index: Int) -> Int
    
    // Provide actual cell
    func getComponentCell(_ tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    
    // This can be optional
    func getComponentHeight(indexPath: IndexPath) -> CGFloat
}
