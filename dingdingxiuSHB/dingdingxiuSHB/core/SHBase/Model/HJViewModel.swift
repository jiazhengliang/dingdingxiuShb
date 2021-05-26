//
//  HJViewModel.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/24.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import RxSwift

class HJViewModel {
    var disposeBag = DisposeBag()
    init() {
        hj_initialize()
    }
}
extension HJViewModel : HJViewModelProtocol {
    
    @objc func hj_initialize() {
        
    }
    
}

protocol HJViewModelProtocol {
    /// 初始化的逻辑绑定
    func hj_initialize()
}
