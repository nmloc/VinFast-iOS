//
//  AppManager.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 17/04/2023.
//

import AmitySDK
import AmityUIKit
import UIKit

class VinFastManager {
    
    static let shared = VinFastManager()
    private init() {}
    
    private enum UserDefaultsKey {
        static let userId = "userId"
        static let userIds = "userIds"
        static let deviceToken = "deviceToken"
    }
    
    // MARK: - AmityUIKit setup
    
    func setupAmityUIKit() {
        // setup api key
        let endpoint = AmityEndpointModel(apiKey: "b0efeb5869dba13145378a1a040d16888400d8e1b23c3c2a", httpEndpoint: AmityRegion.SG.httpUrl, socketEndpoint: AmityRegion.SG.rpcUrl, mqttEndpoint: AmityRegion.SG.mqttHost)
        
        AmityUIKitManager.setup(apiKey: endpoint.apiKey, endpoint: AmityEndpoint(httpUrl: endpoint.httpEndpoint, rpcUrl: endpoint.socketEndpoint, mqttHost: endpoint.mqttEndpoint))
        
        // setup event handlers and page settings
        AmityUIKitManager.set(eventHandler: CustomEventHandler())
        AmityUIKitManager.set(channelEventHandler: CustomChannelEventHandler())
        AmityUIKitManager.feedUISettings.eventHandler = CustomFeedEventHandler()
        AmityUIKitManager.feedUISettings.setPostSharingSettings(settings: AmityPostSharingSettings())
        
        // setup default theme
        if let preset = Preset(rawValue: UserDefaults.standard.theme ?? 0) {
            AmityUIKitManager.set(theme: preset.theme)
        }
        
        // if user has logged in previosly, register the user automatically.
//        if let currentUserId = UserDefaults.standard.value(forKey: UserDefaultsKey.userId) as? String {
//            register(withUserId: "1")
//        }
        register(withUserId: "1")
    }
    
    func register(withUserId userId: String) {
        AmityUIKitManager.registerDevice(withUserId: userId, displayName: nil, sessionHandler: SampleSessionHandler()) { [weak self] success, error in
            print("[VinFast App] register device with userId '\(userId)' \(success ? "successfully" : "failed")")
            if let error = error {
                print("[VinFast App] register device failed \(error.localizedDescription)")
            }
            self?.registerDevicePushNotification()
        }
        UserDefaults.standard.setValue(userId, forKey: UserDefaultsKey.userId)
        
        UIApplication.shared.windows.first?.rootViewController = TabbarViewController()
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    private func registerDevicePushNotification() {
        
        guard let deviceToken = UserDefaults.standard.value(forKey: UserDefaultsKey.deviceToken) as? String else { return }
        
        AmityUIKitManager.registerDeviceForPushNotification(deviceToken) { success, error in
            if success {
                AmityHUD.show(.success(message: "Success with id \(deviceToken)"))
            } else {
                AmityHUD.show(.error(message: "Failed with error \(error?.localizedDescription)"))
            }
        }
    }
    
    func unregister() {
        // 1. unregister push notification
        AmityUIKitManager.unregisterDevicePushNotification() { success, error in
            if let error = error {
                AmityHUD.show(.error(message: "Unregister failed with error \(error.localizedDescription)"))
            }
            
            // 2. unregister user
            //    wether it success or failed, we execute unregister to not breaking logout flow.
            AmityUIKitManager.unregisterDevice()
            UserDefaults.standard.setValue(nil, forKey: UserDefaultsKey.deviceToken)
            UserDefaults.standard.setValue(nil, forKey: UserDefaultsKey.userId)
            
            UIApplication.shared.windows.first?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterNavigationController")
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            UIApplication.shared.applicationIconBadgeNumber = 0  // reset badge counter
        }
    }
    
    func unregisterDevicePushNotification(completion: AmityRequestCompletion?) {
        AmityUIKitManager.unregisterDevicePushNotification(completion: completion)
    }
    
    func registerDeviceToken(_ token: Data) {
        // Revoke old device token
        AmityUIKitManager.unregisterDevicePushNotification()
        
        // Transform deviceToken into a raw string, before sending to AmitySDK server.
        let tokenParts: [String] = token.map { data in String(format: "%02.2hhx", data) }
        let tokenString: String = tokenParts.joined()
        
        UserDefaults.standard.setValue(tokenString, forKey: UserDefaultsKey.deviceToken)
        AmityUIKitManager.registerDeviceForPushNotification(tokenString)
    }
    
    // MARK: - Helpers
    func getDeviceToken() -> String {
        return UserDefaults.standard.value(forKey: UserDefaultsKey.deviceToken) as? String ?? ""
    }
    
}
