//
//  AmityMessageImageOutgoingTableViewCell.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

final class AmityMessageImageOutgoingTableViewCell: AmityMessageImageTableViewCell {
    
    @IBOutlet private var drimView: UIView!
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        drimView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func display(message: AmityMessageModel) {
        if !message.isDeleted {
            switch message.syncState {
            case .syncing:
                activityIndicatorView.startAnimating()
                drimView.isHidden = false
            case .synced, .default, .error:
                activityIndicatorView.stopAnimating()
                drimView.isHidden = true
            @unknown default:
                break
            }
        }
        
        super.display(message: message)
    }
    
    override class func height(for message: AmityMessageModel, boundingWidth: CGFloat) -> CGFloat {
        if message.isDeleted {
            return AmityMessageTableViewCell.deletedMessageCellHeight
        }
        return 180
    }
    
}
