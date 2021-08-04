//
//  ViewController.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/2/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController, Navigatable {
    
    var viewModel: ViewModel?
    var navigator: Navigator!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configUI()
        bindViewModel()
    }
    
    func bindViewModel() {
        
    }
    
    func configUI() {
        
    }
    
    func setupComponent(viewModel: ViewModel?, navigator: Navigator) {
        self.viewModel = viewModel
        self.navigator = navigator
    }

    deinit {
        print("\(type(of: self)) Deinited")
    }
}

