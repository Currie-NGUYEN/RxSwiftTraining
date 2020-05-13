//
//  ViewModel.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    private let apiCalling = APICalling()
    private let disposeBag = DisposeBag()
    var isloading = BehaviorRelay(value: false)
    var datasource = PublishRelay<[countryListModel]>()
    let request = ApiRequest()
    static var viewModel = ViewModel()
    
    static func shared() -> ViewModel {
        return ViewModel.viewModel
    }
    
    func loadData(){
//        NotificationCenter.default.addObserver(self, selector: #selector(resetData), name: NSNotification.Name("resetdata"), object: nil)
        ViewModel.viewModel.isloading.accept(true)
        ViewModel.viewModel.apiCalling.send(apiRequest: request).asDriver(onErrorJustReturn: [countryListModel]()).drive(onNext: { (data) in
            ViewModel.viewModel.datasource.accept(data)
            ViewModel.viewModel.isloading.accept(false)
        }).disposed(by: disposeBag)
    }
    
    /*func loadData2(){
    //        NotificationCenter.default.addObserver(self, selector: #selector(resetData), name: NSNotification.Name("resetdata"), object: nil)
            ViewModel.viewModel.isloading.accept(true)
            ViewModel.viewModel.apiCalling.send(apiRequest: request).asDriver(onErrorJustReturn: [countryListModel]()).drive(onNext: { (data) in
                ViewModel.viewModel.datasource.accept(data)
                ViewModel.viewModel.isloading.accept(false)
            }).disposed(by: disposeBag)
        }*/
    
    @objc func resetData() {
        print("reset")
        ViewModel.viewModel.datasource.accept([])
    }
}
