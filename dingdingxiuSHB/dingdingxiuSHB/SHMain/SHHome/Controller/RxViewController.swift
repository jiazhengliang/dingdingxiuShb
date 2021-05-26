//
//  RxViewController.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/24.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
class RxViewController: HJViewController {

    var mainView:SHRxHomeView?
    
    lazy var viewModel:HJHomeViewModel = {
        let vm = HJHomeViewModel()
        
        return vm
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        
        mainView?.snp.makeConstraints({ (make) in
            make.top.equalTo(view).offset(navigationHeight)
            make.left.right.bottom.equalTo(view).offset(0)

        })
    }
}

extension RxViewController
{
    override func hj_layoutNavigation() {
        
    }
    
    
    override func hj_addSubViews() {
        
        mainView = SHRxHomeView(viewModel: viewModel)
        if let mainView = mainView {
            view.addSubview(mainView)
        }
        view .addSubview(barView)
        barView.setTitle("我的朋友圈")
        barView.backgroundColor = UIColor.white
        barView .setLeftButton(self.leftBtn)
        
    }
    
    override func hj_bindViewModel() {
        
        viewModel.cellClickSubject.subscribe { [weak self] (event) in
            print("click cell : \(String(describing: event.element))")
            
            let vc = HJViewController()
            vc.title = "详情"
            self?.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: self.dispoaseBag)
        
        
        viewModel.homeHeaderViewModel.cellClickSubject.subscribe { (event) in
            print("click collection cell : \(String(describing: event.element))")
        }.disposed(by: self.dispoaseBag)
        
    }
}


class HJViewController: SHBaseController {
    var dispoaseBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        hj_layoutNavigation()
        hj_addSubViews()
        hj_bindViewModel()
    }
    
}

extension HJViewController : HJControllerProtocol {
    
    @objc func hj_bindViewModel() {
        
    }
    
    @objc func hj_addSubViews() {
        
    }
    
    @objc func hj_layoutNavigation() {
        
    }
    
}
protocol HJControllerProtocol {
    /// 绑定viewModel
    func hj_bindViewModel()
    /// 添加子视图
    func hj_addSubViews()
    /// 设置导航栏
    func hj_layoutNavigation()
}
