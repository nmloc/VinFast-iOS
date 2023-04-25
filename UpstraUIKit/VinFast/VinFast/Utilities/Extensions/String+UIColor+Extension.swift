//
//  ColorFilterExtension.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 24/04/2023.
//

import UIKit

extension String {
    var toHex: String {
        switch self {
        case "black":
            return "000000"
        case "white":
            return "FFFFFF"
        case "grey":
            return "666666"
        case "silver":
            return "CCCCCC"
        case "turquoise":
            return "00FFFF"
        case "blue":
            return "4F7ABA"
        case "orange":
            return "C75C1C"
        case "green":
            return "5F9C85"
        case "red":
            return "9D3D3D"
        case "brown":
            return "330000"
        case "yellow":
            return "FFCC00"
        default:
            return ""
        }
    }
    
    func toUIColor() -> UIColor? {
        var hexString = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Check if the hex string has a hash prefix
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        // Check if the hex string has a valid length
        guard hexString.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

