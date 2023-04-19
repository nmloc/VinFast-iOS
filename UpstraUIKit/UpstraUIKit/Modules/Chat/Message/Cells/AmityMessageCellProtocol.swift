//
//  AmityMessageListCellProtocol.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit
import AmitySDK

public protocol AmityMessageCellProtocol: UITableViewCell, AmityCellIdentifiable {
    func display(message: AmityMessageModel)
    static func height(for message: AmityMessageModel, boundingWidth: CGFloat) -> CGFloat
}

protocol AmityMessageCellDelegate: AnyObject {
    func performEvent(_ cell: AmityMessageTableViewCell, events: AmityMessageCellEvents)
    func performEvent(_ cell: AmityMessageTableViewCell, labelEvents: AmityMessageLabelEvents)
}

enum AmityMessageCellEvents {
    case edit
    case delete
    case report
    case tapImage(imageView: UIImageView)
    case audioPlaying
    case audioFinishPlaying
}

enum AmityMessageLabelEvents {
    case tapExpandableLabel(label: AmityExpandableLabel)
    case willExpandExpandableLabel(label: AmityExpandableLabel)
    case didExpandExpandableLabel(label: AmityExpandableLabel)
    case willCollapseExpandableLabel(label: AmityExpandableLabel)
    case didCollapseExpandableLabel(label: AmityExpandableLabel)
}
