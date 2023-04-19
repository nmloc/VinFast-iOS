//
//  Product.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 05/04/2023.
//

import Foundation

struct ProductModel: Identifiable, Codable, Equatable{
    
    let id: Int
    let name: String
    let rate: String
    let price: String
    let image: String
    
}
