//
//  ViewModel.swift
//  NAB_Assignment
//
//  Created by phuong.doan on 8/3/21.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

class ViewModel: NSObject {
    
    let disposeBag = DisposeBag()
    
    let loading = ActivityIndicator()
    let headerLoading = ActivityIndicator()
    let footerLoading = ActivityIndicator()
    
    deinit {
        print("\(type(of: self)) Deinited")
    }
}
