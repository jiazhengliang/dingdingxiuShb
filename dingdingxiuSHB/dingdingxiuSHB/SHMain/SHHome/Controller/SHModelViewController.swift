//
//  SHModelViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHModelViewController: SHBaseController {

    var type:NSString?
    
    var indexPath : NSInteger?
    var daTaSubList:[String] = []
    
    lazy var resignNiketext:UITextField = {
        
        let text = UITextField()
        text.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        
        text.placeholder = "请输入"
        
        text.clearButtonMode = .whileEditing
        text.borderStyle = .roundedRect
        
        return text
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if type == "任务中" {
            title = "输入订单详情"
            daTaSubList  = UserDefaults.standard.object(forKey: "mydingdanging") as! [String]


        } else
        {
            title = "修改资料"

            daTaSubList = UserDefaults.standard.object(forKey: "daTaSubList") as! [String]

        }
        
        resignNiketext.text = daTaSubList[indexPath ?? 0]

  
        
        view.addSubview(barView)
        barView.setTitle("我的")
        barView .setLeftButton(self.leftBtn)
    }
    
    override func configUI() {
        view.addSubview(resignNiketext)
        
        resignNiketext.snp.makeConstraints {
            $0.top.equalToSuperview().offset(navigationHeight + 10)
            $0.height.equalTo(44)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            
        }
    }
    
    @objc override func rightBtnClick(_: UIButton){
        
        print("点击了右键")
        
        
        if indexPath == nil {
            return
        }
        SVProgressHUD.show()
        
        self.perform(#selector(delay), with: nil, afterDelay: 1.0)
        
    }
    
    @objc func delay()
    {
        SVProgressHUD.dismiss()
        daTaSubList[indexPath ?? 0] = resignNiketext.text ?? "";
        
        let userdefaults = UserDefaults.standard
        if type == "任务中" {
            userdefaults.set(daTaSubList, forKey: "mydingdanging")

        } else
        {
            
            userdefaults.set(daTaSubList, forKey: "daTaSubList")

        }
        
        userdefaults.synchronize()
        navigationController?.popViewController(animated: true)
    }
}
