//
//  CustomChannelEventHandler.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import Foundation
import AmityUIKit

class CustomChannelEventHandler: AmityChannelEventHandler {
    
    override func channelDidTap(from source: AmityViewController,
                                channelId: String, subChannelId: String) {
        var settings = AmityMessageListViewController.Settings()
        settings.shouldShowChatSettingBarButton = true
        let viewController = AmityMessageListViewController.make(channelId: channelId, subChannelId: subChannelId, settings: settings)
        if ChatFeatureSetting.shared.iscustomMessageEnabled {
            viewController.dataSource = self
        } else {
            viewController.dataSource = nil
        }
        source.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension CustomChannelEventHandler: AmityMessageListDataSource {
    func cellForMessageTypes() -> [AmityMessageTypes : AmityMessageCellProtocol.Type] {
        return [
            .textIncoming: CustomMessageTextIncomingTableViewCell.self
        ]
    }
}

