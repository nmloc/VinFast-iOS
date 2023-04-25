//
//  ProfileViewController.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 19/04/2023.
//

import UIKit

class ProfileViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - IBOulets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var editAvatarButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var currentLanguageButton: UIButton!
    @IBOutlet weak var titleBarButtonItem: UIBarButtonItem!
    
    // MARK: - IBActions
    @IBAction func didTapEditAvatarButton(_ sender: Any) {
    }
    @IBAction func didTapEditProfile(_ sender: Any) {
    }
    @IBAction func didTapAddress(_ sender: Any) {
    }
    @IBAction func didTapNotification(_ sender: Any) {
    }
    @IBAction func didTapPayment(_ sender: Any) {
    }
    @IBAction func didTapSecurity(_ sender: Any) {
    }
    @IBAction func didTapLanguage(_ sender: Any) {
    }
    @IBAction func didTapDarkMode(_ sender: Any) {
    }
    @IBAction func didTapPrivacyPolicies(_ sender: Any) {
    }
    @IBAction func didTapHelpCenter(_ sender: Any) {
    }
    @IBAction func didTapFriendsInvitation(_ sender: Any) {
    }
    @IBAction func didTapSignOut(_ sender: Any) {
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = background
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        titleBarButtonItem.setTitleTextAttributes(attributes, for: .normal)
        avatarImageView.image = UIImage(named: avatar)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        editAvatarButton.layer.cornerRadius = editAvatarButton.frame.height / 2
        editAvatarButton.setTitle("", for: .normal)
        nameLabel.text = user.name
        idLabel.text = "@" + user.id
        currentLanguageButton.setTitle(user.language, for: .normal)
        emptyButtonTitle()
    }
    
    // This func have to be here because UIButton will automatically render button label is "Button" if you set it be empty string from storyboard only
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    
    private func emptyButtonTitle() {
        button1.setTitle("", for: .normal)
        button2.setTitle("", for: .normal)
        button3.setTitle("", for: .normal)
        button4.setTitle("", for: .normal)
        button5.setTitle("", for: .normal)
        button6.setTitle("", for: .normal)
        button7.setTitle("", for: .normal)
        button8.setTitle("", for: .normal)
        button9.setTitle("", for: .normal)
        button10.setTitle("", for: .normal)
        button11.setTitle("", for: .normal)
        button12.setTitle("", for: .normal)
        button13.setTitle("", for: .normal)
        button14.setTitle("", for: .normal)
        button15.setTitle("", for: .normal)
        button16.setTitle("", for: .normal)
        button17.setTitle("", for: .normal)
        button18.setTitle("", for: .normal)
        button19.setTitle("", for: .normal)
    }
}


