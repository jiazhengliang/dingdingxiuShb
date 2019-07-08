//
//  SHModelViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHModelViewController: SHBaseController {

    
    var indexPath : NSInteger?
    var daTaSubList:[String] = UserDefaults.standard.object(forKey: "daTaSubList") as! [String]
    
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
        
        title = "修改资料"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "确定", titleColor: UIColor.gray, titleFont: UIFont.systemFont(ofSize: 13), titleEdgeInsets: UIEdgeInsets.zero, target: self, action: #selector(rightBtnClick))
        
        
    }
    
    override func configUI() {
        view.addSubview(resignNiketext)
        
        resignNiketext.text = daTaSubList[indexPath ?? 0]
        resignNiketext.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.height.equalTo(44)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            
        }
    }
    
    @objc func rightBtnClick(_: UIButton){
        
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
        
        userdefaults.set(daTaSubList, forKey: "daTaSubList")
        
        userdefaults.synchronize()
        navigationController?.popViewController(animated: true)
    }
}
