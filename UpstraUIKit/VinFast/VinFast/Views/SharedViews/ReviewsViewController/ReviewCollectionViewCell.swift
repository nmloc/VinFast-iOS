//
//  CategoryCollectionViewCell.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 16/04/2023.
//

import UIKit
import AmityUIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reactButton: UIButton!
    @IBOutlet weak var numOfReactionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func setup(item: ReviewModel) {
        avatarImageView.circular(imageURL: item.user.avatarURL!, size: 52)
        nameLabel.text = item.user.name
        rateButton.setTitle(item.rate, for: .normal)
//        optionButton
        contentLabel.text = item.content
        reactButton.setTitle(item.numOfReactions, for: .normal)
        numOfReactionLabel.text = item.numOfReactions
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy, HH:mm"
        timeLabel.text = dateFormatter.date(from: item.createdAt)!.relativeTime
        
        
        rateButton.setTitle("", for: .normal)
        optionButton.setTitle("", for: .normal)
        reactButton.setTitle("", for: .normal)
    }
}
