//
//  HJTableViewHeaderViewModel.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/24.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class HJTableViewHeaderViewModel: HJViewModel {
    /// 首页 header view 标题
    var relay = BehaviorRelay(value: "")
    var title: String? {
        didSet {
            relay.accept(self.title ?? "")
        }
    }
    
    /// 首页 header view 数据源
    var dataArray = [HJTableCollectionCellViewModel]()
    
    /// 刷新 CollectionView UI信号
    var refreshUISubject = PublishSubject<Any>()
    
    /// CollectionView cell点击信号
    var cellClickSubject = PublishSubject<Any>()
}
class HJSectionHeaderViewModel: HJViewModel {
    
    var relay = BehaviorRelay(value: "")
    var title: String? {
        didSet {
            relay.accept(self.title ?? "")
        }
    }
    
}
