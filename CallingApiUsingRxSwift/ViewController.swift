//
//  ViewController.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    var datasource: PublishRelay<[countryListModel]>?
    @IBOutlet weak var tableView: UITableView!
    let indicatorActivity = UIActivityIndicatorView()
        var result: Observable<[countryListModel]>?
    var viewModel = ViewModel.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.isloading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.indicatorActivity.startAnimating()
            } else {
                self.indicatorActivity.stopAnimating()
            }
            }).disposed(by: disposeBag)
        viewModel.datasource.bind(to: self.tableView.rx.items(cellIdentifier: "cell")){ (row, model, cell) in
                    cell.textLabel?.text = model.name
        }.disposed(by: disposeBag)
        loadingData()
        
        setupIndicator()
        self.indicatorActivity.startAnimating()
        
        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            let cell = self.tableView.cellForRow(at: indexPath)
            cell?.textLabel?.text = "Clicked!"
            }).disposed(by: disposeBag)
    }

    private func setupIndicator(){
        self.view.addSubview(indicatorActivity)
        self.indicatorActivity.style = .large
        self.indicatorActivity.tintColor = .black
        self.indicatorActivity.frame = .init(x: 0, y: 0, width: 200, height: 200)
        self.indicatorActivity.center = view.center
    }

    @IBAction func refreshTapped(_ sender: Any) {
        viewModel.loadData()
    }
    
    private func loadingData() {
        viewModel.loadData()
    }
}

