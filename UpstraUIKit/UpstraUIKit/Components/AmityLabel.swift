//
//  AmityLabel.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

final class AmityLabel: UILabel {
    
    override var text: String? {
        didSet {
            updateLineSpacing()
        }
    }
    
    var lineSpacing: CGFloat = 4 {
        didSet {
            updateLineSpacing()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateLineSpacing()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLineSpacing()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateLineSpacing()
    }
    
    private func updateLineSpacing() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = lineBreakMode
        attributedText = NSAttributedString(string: text ?? "",
                                            attributes: [
                                                .paragraphStyle: paragraphStyle
                                            ])
    }
}
