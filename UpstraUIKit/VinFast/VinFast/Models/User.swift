//
//  User.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 17/04/2023.
//

import Foundation

struct UserModel: Identifiable, Codable, Equatable{
    
    let id: String
    let name: String
    let avatarURL: String?
    let phoneNumber: String
    let language: String
    let darkMode: String?
    
}
