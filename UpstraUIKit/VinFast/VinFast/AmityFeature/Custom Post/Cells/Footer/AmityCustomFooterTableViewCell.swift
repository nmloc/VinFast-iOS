//
//  AmityCustomFooterTableViewCell.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit
import AmityUIKit

class AmityCustomFooterTableViewCell: UITableViewCell, AmityPostFooterProtocol {
    
    weak var delegate: AmityPostFooterDelegate?
    
    @IBOutlet private var likeButton: UIButton!
    var post: AmityPostModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func display(post: AmityPostModel) {
        self.post = post
    }
    
    @IBAction func likeTap() {
        
//        delegate?.didPerformAction(self, action: .tapLike)
    }
    
}
