//
//  TabbarViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import AmityUIKit
import UIKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        registerForPushNotifications()
    }
    
    private func setupViewControllers() {
        let feature = UINavigationController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeatureViewController"))
        feature.tabBarItem.title = "Feature"
        
        let setting = UINavigationController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController"))
        setting.tabBarItem.title = "Setting"
        
        viewControllers = [ feature,
                            setting,
                           /* UINavigationController(rootViewController: AmityCommunityHomePageViewController.make()) */]
    }
    
    private func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                guard granted else { return }
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
    }
}
