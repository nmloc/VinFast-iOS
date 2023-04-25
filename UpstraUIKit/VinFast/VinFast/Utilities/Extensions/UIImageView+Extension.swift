//
//  CircularImageExtension.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 17/04/2023.
//

import UIKit

extension UIImageView {
    func circular(imageURL: String, size: CGFloat) -> UIImageView {
        self.heightAnchor.constraint(equalToConstant: size).isActive = true
        self.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        // Make image circular
        self.layer.cornerRadius = size / 2
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.systemBackground.cgColor
        self.clipsToBounds = true
        
        // Load image from URL asynchronously
        guard let url = URL(string: imageURL) else {
            self.image = UIImage(named: "John Wick")
            return self
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.image = UIImage(named: "John Wick")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
        
        return self
    }
}
