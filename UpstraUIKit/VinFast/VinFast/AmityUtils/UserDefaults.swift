//
//  UserDefaults.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmityUIKit
extension UserDefaults {
    
    var theme: Int? {
        get {
            return integer(forKey: #function)
        } set {
            return set(newValue, forKey: #function)
        }
    }
    
}
