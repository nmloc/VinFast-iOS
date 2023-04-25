//
//  Review.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 23/04/2023.
//

import Foundation

struct ReviewModel: Identifiable, Codable, Equatable{
    
    let id: String
    let user: UserModel
    let rate: String
    let content: String
    let numOfReactions: String
    let createdAt: String
    
}
