//
//  AmityDynamicHeightTableView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

// Note:
// Use this tableview subclass when you want your tableview height
// to be equal to its content size height.
//
// By using this you lose cell reuse advantage for tableview.
// So use this with caution!!
class AmityDynamicHeightTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
