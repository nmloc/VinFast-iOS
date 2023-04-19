//
//  AmityColorSet.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

struct AmityColorSet {
    
    static var primary: UIColor {
        return AmityThemeManager.currentTheme.primary
    }
    static var secondary: UIColor {
        return AmityThemeManager.currentTheme.secondary
    }
    static var alert: UIColor {
        return AmityThemeManager.currentTheme.alert
    }
    static var highlight: UIColor {
        return AmityThemeManager.currentTheme.highlight
    }
    static var base: UIColor {
        return AmityThemeManager.currentTheme.base
    }
    static var baseInverse: UIColor {
        return AmityThemeManager.currentTheme.baseInverse
    }
    static var messageBubble: UIColor {
        return AmityThemeManager.currentTheme.messageBubble
    }
    static var messageBubbleInverse: UIColor {
        return AmityThemeManager.currentTheme.messageBubbleInverse
    }
    static var backgroundColor: UIColor {
        return UIColor.systemBackground
    }
    
}
