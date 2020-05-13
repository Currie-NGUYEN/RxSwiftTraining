//
//  Model.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import Foundation

struct countryModel: Codable {
    let code: Int?
    let result: [countryListModel]?
    
    private enum CodingKeys: String, CodingKey{
        case code
        case result
    }
}

struct countryListModel: Codable {
    let code: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
