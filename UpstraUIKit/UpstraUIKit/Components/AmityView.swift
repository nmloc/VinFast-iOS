//
//  AmityView.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit

public class AmityView: UIView, NibFileOwnerLoadable {
    
    public var contentView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initial()
    }
    
    func initial() { }
    
}
