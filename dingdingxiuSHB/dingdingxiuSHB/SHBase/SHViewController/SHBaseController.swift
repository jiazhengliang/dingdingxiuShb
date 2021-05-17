//
//  SHBaseController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/6/29.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class SHBaseController: UIViewController {
    lazy var  leftBtn :UIButton = {
        let t1 = UIButton()
        t1.setImage(UIImage.init(named: "login_back"), for: .normal)
        t1.frame = CGRect(x: 0, y: 0, width: 44, height: 44);
        t1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        t1.setTitleColor(UIColor.gray, for: .normal)
        t1.setTitleColor(UIColor(r: 245, g: 38, b: 88, a: 1), for: .selected)
        t1.addTarget(self, action: #selector(LeftBtnClick), for: .touchUpInside)
        return t1
    }()
    
    lazy var  rightBtn :UIButton = {
        let t1 = UIButton()
        t1.setTitle("", for: .normal)
        t1.frame = CGRect(x: 0, y: 0, width: 44, height: 44);
        t1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        t1.setTitleColor(UIColor.gray, for: .normal)
        t1.setTitleColor(UIColor(r: 55, g: 55, b: 55, a: 1), for: .selected)

        t1.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        return t1
    }()
    
    
    @objc func rightBtnClick(_: UIButton){
        
        print("点击了右键")


    }
    
    
    @objc func LeftBtnClick(_: UIButton){
        
        print("点击了LeftBtnClick")
        self.navigationController?.popViewController(animated: true)

    }
    lazy var barView:YJCustomNavView = {
        let view = YJCustomNavView()
        view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: navigationHeight)
        view.backgroundColor = UIColor.white;

        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        self.fd_prefersNavigationBarHidden = true
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
            
        }
        configUI()
        
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    func configNavigationBar() {
        
        guard let navi = navigationController else {
            return;
        }
    
            if navi.viewControllers.count > 1{
                tabBarController?.hidesBottomBarWhenPushed = true;
            }else
            {
                tabBarController?.hidesBottomBarWhenPushed = false;
            }
        
        
        
    }
    
    
    @objc func pressBack()  {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
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

extension SHBaseController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
