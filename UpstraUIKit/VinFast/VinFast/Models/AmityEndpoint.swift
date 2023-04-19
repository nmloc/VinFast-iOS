//
//  AmityEndpoint.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 17/04/2023.
//

import Foundation

struct AmityEndpointModel: Codable {
    
    let apiKey: String
    let httpEndpoint: String
    let socketEndpoint: String
    let mqttEndpoint: String
    
}
