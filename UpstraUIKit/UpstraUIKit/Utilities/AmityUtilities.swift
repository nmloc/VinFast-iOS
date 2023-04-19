//
//  AmityUtilities.swift
//  AmityUIKit
//
//  Created by Nguyen Minh Loc on 03/04/2023.
//

import UIKit

struct AmityUtilities {
    static func showError() {
        let alertController = UIAlertController(title: "Something wrong", message: "Please try again", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: AmityLocalizedStringSet.General.ok.localizedString, style: .default, handler: nil))
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
    static func UINibs(nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: AmityUIKitManager.bundle)
    }
}
