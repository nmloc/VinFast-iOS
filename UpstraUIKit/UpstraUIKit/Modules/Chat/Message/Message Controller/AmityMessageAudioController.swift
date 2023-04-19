//
//  AmityMessageAudioController.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023. 
//

import UIKit
import AmitySDK

// Manage audio message
final class AmityMessageAudioController {
    
    private let subChannelId: String
    private weak var repository: AmityMessageRepository?
    
    private var token: AmityNotificationToken?
    private var message: AmityObject<AmityMessage>?
    
    init(subChannelId: String, repository: AmityMessageRepository?) {
        self.subChannelId = subChannelId
        self.repository = repository
    }
    
    func create(completion: @escaping () -> Void) {
        
        guard let audioURL = AmityAudioRecorder.shared.getAudioFileURL() else {
            Log.add("Audio file not found")
            return
        }
        
        guard let repository = repository else {
            return
        }
        let createOptions = AmityAudioMessageCreateOptions(subChannelId: subChannelId, audioFileURL: audioURL, fileName: AmityAudioRecorder.shared.fileName)
        repository.createAudioMessage(options: createOptions) { message, error in
            guard error == nil, let message = message else {
                return
            }
            self.token = repository.getMessage(message.messageId).observe { [weak self] (collection, error) in
                guard error == nil, let message = collection.object else {
                    self?.token = nil
                    return
                }
                AmityAudioRecorder.shared.updateFilename(withFilename: message.messageId)
                completion()
            }
        }
        
    }
    
}
