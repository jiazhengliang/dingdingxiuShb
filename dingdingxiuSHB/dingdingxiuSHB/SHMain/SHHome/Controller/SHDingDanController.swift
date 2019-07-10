//
//  SHDingDanController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHDingDanController: SHBaseController {

    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .grouped)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHDingdanCell.self)
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
        
    }
}

extension SHDingDanController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHDingdanCell.self)
        
        cell.addressLab.text = "地址：深圳市宝安西乡街道华侨西村 211"
        
        cell.peopleLab.text = "联系人：张小凡 13788889999"
        cell.timeLab.text = "维修时间：2019-12-12"
        cell.tipLabel.text = "故障：电脑黑屏，系统奔溃"
        cell.baoxiuLab.text = "是否保修内：不在保修内"
        cell.statusLab.text = "订单状态：已经接单"
        cell.contentView.backgroundColor = UIColor.init(r: 235, g: 240, b: 245)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 255
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modelVC = SHModelViewController()
        modelVC.indexPath = indexPath.row;
        
        if indexPath.row == 2 {
            view.showXHToastCenterWithText("不能修改手机号")
            return
        }
        navigationController?.pushViewController(modelVC, animated: true)
    }
    
}
