//
//  ReviewExtension.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 23/04/2023.
//

import UIKit

extension Int {
    func grammaticalReview(rate: Double) -> String {
        switch self {
        case 0:
            return "\(rate) (No reviews)"
        case 1:
            return "\(rate) (1 review)"
        default:
            return "\(rate) (\(self) reviews)"
        }
    }
}
