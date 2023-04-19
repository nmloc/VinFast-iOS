//
//  AmityThemeManager.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

class AmityThemeManager {
    private var lightTheme = AmityTheme()
    private var darkTheme = AmityTheme()
    private var interfaceStyle: AmityInterfaceStyle = .light
    private var currentTheme: AmityTheme {
        return interfaceStyle == .dark ? darkTheme : lightTheme
    }
    
    private static let defaultManager = AmityThemeManager()
    
    static var currentTheme: AmityTheme {
        return defaultManager.currentTheme
    }
    
    static func set(theme: AmityTheme, for interfaceStyle: AmityInterfaceStyle = .light) {
        if interfaceStyle == .dark {
            defaultManager.darkTheme = theme
        } else {
            defaultManager.lightTheme = theme
        }
    }
    
}
