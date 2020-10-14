//
//  SHMineViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHMineViewController: SHBaseController {

    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHMineTabCell.self)
        return tab
    }()
    
    var daTaList = ["昵称","性别","电话号码","地址","体重","身高","证书","特长"]
    
    var daTaSubList:[String]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        title = "个人资料"
        
        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
        
    }
    
    override func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
        
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userdefaults = UserDefaults.standard

        let tempList =  userdefaults.object(forKey: "daTaSubList")
        if daTaSubList == nil {
            
            userdefaults.set(["小草哥","男","13788889999","深圳后海大道101","70kg","173CM","二级工程师","维修家电"], forKey: "daTaSubList")
            
            userdefaults.synchronize()
            
            daTaSubList = ["小草哥","男","13788889999","深圳后海大道101","70kg","173CM","二级工程师","维修家电"]
        } else
        {
            daTaSubList = tempList as! [String];
        }
        
        
        tableView.reloadData()
        
    }
    
    
}
extension SHMineViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daTaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHMineTabCell.self)
        cell.subLab.text = daTaSubList?[indexPath.row]
        cell.tipLabel.text = daTaList[indexPath.row]
        if indexPath.row == 2 {
            cell.accessoryType = .none
            
        } else
        {
            cell.accessoryType = .disclosureIndicator
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modelVC = SHModelViewController()
        modelVC.indexPath = indexPath.row;
        
        if indexPath.row == 2 {
            view.showXHToastCenterWithText("不能修改手机号")
            return
        }
        modelVC.hidesBottomBarWhenPushed = true;
        navigationController?.pushViewController(modelVC, animated: true)
    }
    
}
