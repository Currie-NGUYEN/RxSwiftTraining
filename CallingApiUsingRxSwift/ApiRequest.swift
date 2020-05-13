//
//  ApiRequest.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case GET, POST, PUT, DELETE
}

class ApiRequest {
    let baseURL = URL(string: "https://api.printful.com/countries")!
    let baseURL2 = URL(string: "https://api.printful.com/countriea")!
    var method = RequestType.GET
    var parameters = [String: String]()
    
    func request(with baseURL: URL) ->URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
