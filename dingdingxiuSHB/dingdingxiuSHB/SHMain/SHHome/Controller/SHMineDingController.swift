//
//  SHMineDingController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/9.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHMineDingController: SHBaseController {

    var type = "任务中"

    
    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHDingdanCell.self)
        return tab
    }()
    lazy var  leftBtn :UIButton = {
        let t1 = UIButton()
        t1.setTitle("任务中", for: .normal)
        t1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        t1.setTitleColor(UIColor.gray, for: .normal)
        t1.setTitleColor(UIColor(r: 245, g: 38, b: 88, a: 1), for: .selected)
        t1.addTarget(self, action: #selector(attentionBtnClick(sender:)), for: .touchUpInside)
        return t1
    }()
    
    lazy var  rightBtn :UIButton = {
        let t1 = UIButton()
        t1.setTitle("已完成", for: .normal)
        t1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        t1.setTitleColor(UIColor.gray, for: .normal)
        t1.setTitleColor(UIColor(r: 245, g: 38, b: 88, a: 1), for: .selected)

        t1.addTarget(self, action: #selector(attentionBtnClick(sender:)), for: .touchUpInside)
        return t1
    }()
    
    
    var mydingdangDone = ["黄贵生 13756533323","洗衣机","不能脱水","2019-6-12","等待上门处理","已支付","深圳市宝安西乡街华富新村4巷","30元","230元","更换马达","260元",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        let userdefaults = UserDefaults.standard

        var mydingdanging  =  userdefaults.object(forKey: "mydingdanging")
        
        if mydingdanging == nil {
            
            mydingdanging = ["李林哲 13756589954","电脑","黑屏卡机","2019-10-12","等待上门处理","未支付","深圳市宝安福海街道海峰村4巷","30元","130元","更换电路板","160元",]
            userdefaults.set(mydingdanging, forKey: "mydingdanging")
            
            userdefaults.synchronize()
        }

        
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(64 + 40)
            $0.bottom.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            
        }
        
        
        let topView =  UIView(frame:CGRect.init(x: 0, y: 64, width: screenWidth, height: 40))
        
        topView.backgroundColor = UIColor.white
        
        let lineView =  UIView(frame:CGRect.init(x: 0, y: 40, width: screenWidth, height: 0.5))
        
        lineView.backgroundColor = UIColor.gray
        
        topView.addSubview(lineView)
        view.addSubview(topView)
        topView.addSubview(leftBtn)
        topView.addSubview(rightBtn)
 
        let lineView2 =  UIView(frame:CGRect.init(x: screenWidth/2, y: 0, width: 0.5, height: 40))

        lineView2.backgroundColor = UIColor.gray

        topView.addSubview(lineView2)
        leftBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.left.equalToSuperview().offset(0)
            $0.width.equalTo(screenWidth/2)
            
        }
        rightBtn.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.width.equalTo(screenWidth/2)
            
        }
        
        leftBtn.isSelected = true
    }

    
   @objc func attentionBtnClick(sender: UIButton) {
    sender.isSelected = true
    if sender == leftBtn {
        rightBtn.isSelected = false
        
    }else
    {
        leftBtn.isSelected = false

    }
    
    self.tableView.reloadData()
    }
    

}
extension SHMineDingController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHDingdanCell.self)
        var address:NSString;
        var peopleLab:NSString;
        var timeLab:NSString;
        var tipLabel:NSString;
        var baoxiuLab:NSString;
        var statusLab:NSString;
        var name:NSString;

//        ["李林哲 13756589954","电脑","黑屏卡机","2019-10-12","等待上门处理","未支付","深圳市宝安福海街道海峰村4巷","30元","130元","更换电路板","160元",]
        if leftBtn.isSelected {
             var mysubDate = UserDefaults.standard.object(forKey: "mydingdanging") as! [String]
            name = mysubDate[1] as NSString;

            address = mysubDate[6] as NSString;
            peopleLab = mysubDate[0] as NSString
            
            timeLab = mysubDate[3] as NSString
            
            tipLabel = mysubDate[2] as NSString
            
            baoxiuLab = mysubDate[5] as NSString
            statusLab = mysubDate[4] as NSString

        } else
        {
            address = mydingdangDone[6] as NSString;
            peopleLab = mydingdangDone[0] as NSString
            
            timeLab = mydingdangDone[3] as NSString
            name = mydingdangDone[1] as NSString;

            tipLabel = mydingdangDone[2] as NSString
            
            baoxiuLab = mydingdangDone[5] as NSString
            statusLab = mydingdangDone[4] as NSString
        }
        cell.addressLab.text = "地址：\(address)"
//
        cell.peopleLab.text = "联系人：\(peopleLab)"
        cell.timeLab.text = "维修时间：\(timeLab)"
        cell.tipLabel.text = "故障：\(name )\(tipLabel)"
        cell.baoxiuLab.text = "是否支付：\(baoxiuLab)"
        cell.baoxiuLab.textColor = UIColor.red
        cell.statusLab.text = "订单状态：\(statusLab)"
        cell.attentionBtn.isHidden = true;
        
        cell.contentView.backgroundColor = UIColor.init(r: 223, g: 223, b: 223)
        
        cell.contentView.layer.cornerRadius = 10;
        cell.contentView.layer.masksToBounds = true;
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        ;
        cell.contentView.layer.borderWidth = 2;
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SHdingDetailController()
        if leftBtn.isSelected {
            var mysubDate = UserDefaults.standard.object(forKey: "mydingdanging") as! [String]

            vc.type = "任务中"
            vc.daTaSubList = mysubDate;

        } else
        {
            vc.type = "已完成"
            vc.daTaSubList = mydingdangDone;

        }
        vc.hidesBottomBarWhenPushed = true;
        navigationController?.pushViewController(vc, animated: true)
        
     
    }
    
    
}
