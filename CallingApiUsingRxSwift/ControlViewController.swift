//
//  ControlViewController.swift
//  CallingApiUsingRxSwift
//
//  Created by Currie on 5/12/20.
//  Copyright © 2020 Currie. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ControlViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    let viewModel = ViewModel.shared()
    
    @IBOutlet weak var updateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButton.rx.tap.subscribe(onNext: { (_) in
            print("Tapped")
//            NotificationCenter.default.post(name: NSNotification.Name("resetdata"), object: nil)
            self.viewModel.datasource.accept([])
        }).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
