//
//  SHListController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHListController: SHBaseController {


    
    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHDingdanCell.self)
        return tab
    }()
    var  dic = [["addressLab":"地址：深圳市宝安西乡街道径贝新村 3巷 2号 211",
                      "peopleLab":"联系人：李思敏 13578789021",
                      "timeLab":"维修时间：2019-8-12",
                      "tipLabel":"故障：洗衣机坏了，洗衣机不能转",
                      "baoxiuLab":"是否保修内：不在保修内",
                      "statusLab":"订单状态：等待接单"],
                
                     ["addressLab":"地址：深圳市宝安西乡街道华侨西村 211",
                      "peopleLab":"联系人：张小凡 13788889999",
                      "timeLab":"维修时间：2019-12-12",
                      "tipLabel":"故障：电脑黑屏，系统奔溃",
                      "baoxiuLab":"是否保修内：不在保修内",
                      "statusLab":"订单状态：等待接单"],
                     
                     ["addressLab":"地址：深圳市宝安西乡街道金贝村 302",
                      "peopleLab":"联系人：林凡 13656003421",
                      "timeLab":"维修时间：2019-11-12",
                      "tipLabel":"故障：冰箱坏了，不能制冷",
                      "baoxiuLab":"是否保修内：不在保修内",
                      "statusLab":"订单状态：等待接单"],
                     
                     ["addressLab":"地址：深圳市宝安西乡街道华富新村 400",
                      "peopleLab":"联系人：李小意 13288324555",
                      "timeLab":"维修时间：2019-8-12",
                      "tipLabel":"故障：空调不能制冷，启动不了",
                      "baoxiuLab":"是否保修内：不在保修内",
                      "statusLab":"订单状态：等待接单"],
                     
                     ["addressLab":"地址：深圳市宝安福海街道海名村 312",
                      "peopleLab":"联系人：贾宝玲 13288886943",
                      "timeLab":"维修时间：2019-12-12",
                      "tipLabel":"故障：电脑黑屏，系统奔溃",
                      "baoxiuLab":"是否保修内：不在保修内",
                      "statusLab":"订单状态：已经接单"],
    ]
    
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
extension SHListController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHDingdanCell.self)
        
        let subDic = dic[indexPath.row]
        
        
        cell.addressLab.text = subDic["addressLab"]
        cell.peopleLab.text = subDic["peopleLab"]
        cell.timeLab.text = subDic["timeLab"]
        cell.tipLabel.text = subDic["tipLabel"]
        cell.baoxiuLab.text = subDic["baoxiuLab"]
        cell.statusLab.text = subDic["statusLab"]
        cell.delegate = self as! SHTabbleViewDelegate
        cell.contentView.backgroundColor = UIColor.init(r: 235, g: 240, b: 245)
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

}

}

extension SHListController :SHTabbleViewDelegate{
    func didClickButton(_ name: Int, type: String) {
        let alercontroll = UIAlertController(title: "是否抢单", message: "接下订单后需尽快处理订单", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确认", style: .destructive , handler: { (action: UIAlertAction!) -> Void in

        })
        okAction.isEnabled = false
        alercontroll.addAction(cancelAction)
        alercontroll.addAction(okAction)
        self.present(alercontroll, animated: true, completion: nil)
        
    }
    
    
}
