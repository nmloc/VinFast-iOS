//
//  UIViewController+BackButton+Extension.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 24/04/2023.
//

import UIKit

extension UIViewController {
    open override func awakeAfter(using coder: NSCoder) -> Any? {
        navigationItem.backButtonDisplayMode = .minimal // This will help us to remove text
        return super.awakeAfter(using: coder)
    }
}
