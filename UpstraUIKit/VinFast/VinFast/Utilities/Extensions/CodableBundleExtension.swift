//
//  CodableBundleExtension.swift
//  VinFast
//
//  Created by Nguyen Minh Loc on 05/04/2023.
//

import Foundation

extension Bundle{
    func decode<T: Codable>( _ file : String ) -> T {
        
        //locate json file
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file)")
        }
        
        //create property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        
        
        //create decoder
        let decoder = JSONDecoder()
        
        //cretae a property for the decoded data
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
    
        //return data
        return decodedData
    }
}
