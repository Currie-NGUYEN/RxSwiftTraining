//
//  APICalling.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import Foundation
import RxSwift

class APICalling {
    func send<T: Codable>(apiRequest: ApiRequest) -> Observable<T>{
        return Observable.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: countryModel = try JSONDecoder().decode(countryModel.self, from: data ?? Data())
                    observer.onNext(model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func send2<T: Codable>(apiRequest: ApiRequest) -> Observable<T>{
        return Observable.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL2)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: countryModel = try JSONDecoder().decode(countryModel.self, from: data ?? Data())
                    observer.onNext(model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
