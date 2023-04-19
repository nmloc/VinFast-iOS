//
//  AmityAttributedString.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityAttributedString {
    private var fullText: String = ""
    private var boldText: [String] = []
    private var boldFont: UIFont = UIFont.systemFont(ofSize: 14)
    private var normalFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    private var color: UIColor = .black
    
    @discardableResult
    func setTitle(_ text: String) -> AmityAttributedString {
        fullText = text
        return self
    }
    
    @discardableResult
    func setBoldText(for text: [String]) -> AmityAttributedString {
        boldText = text
        return self
    }
    
    @discardableResult
    func setBoldFont(for font: UIFont) -> AmityAttributedString {
        boldFont = font
        return self
    }
    
    @discardableResult
    func setNormalFont(for font: UIFont) -> AmityAttributedString {
        normalFont = font
        return self
    }
    
    @discardableResult
    func setColor(for color: UIColor) -> AmityAttributedString {
        self.color = color
        return self
    }
    
    func build() -> NSAttributedString {
        return fullText.applyBold(with: boldText, color: color, font: (normalFont, boldFont))
    }
}
