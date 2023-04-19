//
//  CircleAvatarView.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 17/04/2023.
//

import UIKit

// USAGE GUIDE to use this custom class in any View Controller
// Please add the below code snippet to override 'viewDidAppear' function your View Controller

////override func viewDidAppear(_ animated: Bool) {
////    super.viewDidAppear(animated)
////    if circleAvatar.frame.height > circleAvatar.frame.width {
////        circleAvatar.layer.cornerRadius = circleAvatar.frame.width / 2.0
////    } else {
////        circleAvatar.layer.cornerRadius = circleAvatar.frame.height / 2.0
////    }
////}

// Override 'viewDidAppear' func to resize image radius based on any device layout

class CircleAvatar: UIImageView {
    convenience init(imageUrl: String) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)))
        configure(with: imageUrl)
    }
    
    private func configure(with imageUrl: String) {
        // Set default image
        image = UIImage(named: "John Wick")
        
        // Make image circular
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.borderColor = UIColor.systemBackground.cgColor
        clipsToBounds = true
        
        // Fix height + width for the image to 40 < height of navigation bar (44px)
        heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: (image?.size.width)! / (image?.size.height)!).isActive = true
        
        
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
