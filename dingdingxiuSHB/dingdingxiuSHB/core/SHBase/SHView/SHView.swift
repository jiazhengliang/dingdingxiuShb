//
//  SHView.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/24.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import RxSwift
class SHView: UIView {

    var dispoaseBag = DisposeBag()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        hj_setupViews()
        hj_bindViewMode()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hj_setupViews()
        hj_bindViewMode()
    }
    
}
extension SHView: HJViewProtocol {
    
    @objc func hj_setupViews() {
        
    }
    @objc func hj_bindViewMode() {
        
    }
}
enum HJRefreshDataStatus {
    case HJHeaderRefresh_hasMoreData
    case HJHeaderRefresh_hasNoMoreData
    case HJFooterRefresh_hasMoreData
    case HJFooterRefresh_hasNoMoreData
    case HJRefreshError
    case HJRefreshUI
}

protocol HJViewProtocol {
    /// 添加子视图
    func hj_setupViews()
    /// 绑定ViewModel
    func hj_bindViewMode()
}
