//
//  UINavigationController+Extension.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

extension UINavigationController {
    
    func setBackgroundColor(with color: UIColor, shadow: Bool = false) {
        if !shadow {
            navigationBar.shadowImage = UIImage()
        }
    }
    
    func reset() {
        navigationBar.backgroundColor = nil
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = nil
    }
    
    func previousViewController() -> UIViewController? {
        guard viewControllers.count > 1 else {
            return nil
        }
        return viewControllers[viewControllers.count - 2]
    }
}

