//
//  SHdingDetailController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/10.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHdingDetailController: SHBaseController {

    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .grouped)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHMineTabCell.self)
        return tab
    }()
    var  daTaSubList = ["李林哲 13756589954","电脑","黑屏卡机","2019-10-12","等待上门处理","未支付","深圳市宝安福海街道海峰村4巷","30元","130元","更换电路板","160元",]
    
    var daTaList = ["姓名","类别","故障","维修时间","订单状态","是否支付","地址","人工费","维修费","具体材料","合计"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "订单详情"
        
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
        
        
        tableView.reloadData()
        
    }
    
    
}
extension SHdingDetailController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daTaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHMineTabCell.self)
        cell.subLab.text = daTaSubList[indexPath.row]
        cell.tipLabel.text = daTaList[indexPath.row]
        
       
        if indexPath.row>6 {
            cell.accessoryType = .disclosureIndicator
        } else
        {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        let submitBtn = UIButton()
        
        submitBtn.frame = CGRect.init(x: 10, y: 5, width: screenWidth-20, height: 40)
        
        view.addSubview(submitBtn)
        submitBtn .setTitle("提交", for: .normal)
        submitBtn.backgroundColor = UIColor(r: 247, g: 114, b: 82)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modelVC = SHModelViewController()
        modelVC.indexPath = indexPath.row;
        
        if indexPath.row < 6 {
            view.showXHToastCenterWithText("不能修改手机号")
            return
        }
        navigationController?.pushViewController(modelVC, animated: true)
    }


}
