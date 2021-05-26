//
//  HJHomeViewModel.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/24.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import RxSwift

class HJHomeViewModel: HJViewModel {
    /// 当前页数
    private var currentPage: Int = 0
    
    /// 修改 MJRefresh 控件的的信号
    var refreshEndSubject = PublishSubject<HJRefreshDataStatus>()
    
    
    var refreshUI = PublishSubject<Any>()
    
    /// 刷新网络请求回调信号
    var refreshDataCommand = PublishSubject<[String : Any]>()
    /// 刷新网络请求信号
    var refreshDataRequest = PublishSubject<Any>()
    
    
    /// 加载更多网络请求回调信号
    var nextPageCommand = PublishSubject<[String: Any]>()
    /// 加载更多请求信号
    var nextPageDataRequest = PublishSubject<Any>()
    
    /// 首页header的ViewModel
    lazy var homeHeaderViewModel:HJTableViewHeaderViewModel = {
        var headerViewModel = HJTableViewHeaderViewModel()
        headerViewModel.title = "已加入的圈子"
        return headerViewModel
    }()
    
    
    /// 首页 section 的ViewModel
    lazy var sectionHeaderViewModel: HJSectionHeaderViewModel = {
        var vm = HJSectionHeaderViewModel()
        vm.title = "推荐圈子"
        return vm
    }()
    
    var dataArray = [HJTableCollectionCellViewModel]()
    var dataArrayObservable: Observable<Any>?
    
    /// 首页 cell 点击信号
    var cellClickSubject = PublishSubject<Any>()
    
    
    override func hj_initialize() {
        
        
        refreshDataRequest.subscribe(onNext: { [weak self] (_) in
            self?.currentPage = 1;
            /// 模拟网络请求
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
                self?.refreshDataCommand.onNext([:])
            }
            
        }).disposed(by: self.disposeBag)
        
        
        nextPageDataRequest.subscribe(onNext: { [weak self] (_) in
            self?.currentPage = (self?.currentPage ?? 0) + 1
            /// 模拟网络请求
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
                self?.nextPageCommand.onNext([:])
            }
        }).disposed(by: self.disposeBag)
        
        refreshDataCommand.subscribe(onNext:  { [weak self] (_) in
            var sources = [HJTableCollectionCellViewModel]()
            /// 生成首页 header view 数据
            for i in 0..<10 {
                let viewModel: HJTableCollectionCellViewModel = HJTableCollectionCellViewModel()
                viewModel.headerImageStr = "http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5"
                viewModel.name = "财税圈子\(i)"
                sources.append(viewModel)
            }
            self?.homeHeaderViewModel.dataArray = sources
            
            
            var reArray = [HJTableCollectionCellViewModel]()
            for i in 0..<10 {
                let viewModel: HJTableCollectionCellViewModel = HJTableCollectionCellViewModel()
                viewModel.headerImageStr = "http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
                viewModel.name = "财税培训圈子\(i)";
                viewModel.articleNum = "1568";
                viewModel.peopleNum = "568";
                viewModel.topicNum = "5749";
                viewModel.content = "自己交保险是不是只能交养老和医疗，费用是多少?";
                reArray.append(viewModel)
            }
            
            self?.dataArray = reArray
            
            self?.dataArrayObservable = Observable.from(optional: self?.dataArray)
            
            self?.refreshUI.onNext("刷新界面")
            self?.refreshEndSubject.onNext(.HJHeaderRefresh_hasMoreData)
            self?.homeHeaderViewModel.refreshUISubject.onNext("首页 header view 刷新")
            
        }).disposed(by: self.disposeBag)
        
        /// 上拉加载更多回调
        nextPageCommand.subscribe { [weak self] (_) in
            
            var reArray = [HJTableCollectionCellViewModel]() + (self?.dataArray ?? [])
            let reCount = reArray.count
            for i in 0..<10 {
                let viewModel: HJTableCollectionCellViewModel = HJTableCollectionCellViewModel()
                viewModel.headerImageStr = "http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
                viewModel.name = "加载更多财税培训圈子\(reCount + i)";
                viewModel.articleNum = "1568";
                viewModel.peopleNum = "568";
                viewModel.topicNum = "5749";
                viewModel.content = "自己交保险是不是只能交养老和医疗，费用是多少?";
                reArray.append(viewModel)
            }
            
            self?.dataArray = reArray
            self?.refreshEndSubject.onNext(.HJFooterRefresh_hasMoreData)
            
        }.disposed(by: self.disposeBag)
    }
    
    
    
}
