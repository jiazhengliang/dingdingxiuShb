//
//  SHMineDingController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/9.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHMineDingController: SHBaseController {


    
    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .grouped)
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
        t1.setTitle("立即抢单", for: .normal)
        t1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        t1.setTitleColor(UIColor.gray, for: .normal)
        t1.setTitleColor(UIColor(r: 245, g: 38, b: 88, a: 1), for: .selected)

        t1.addTarget(self, action: #selector(attentionBtnClick(sender:)), for: .touchUpInside)
        return t1
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
        
        rightBtn.isSelected = true
    }

    
   @objc func attentionBtnClick(sender: UIButton) {
    sender.isSelected = true
    if sender == leftBtn {
        rightBtn.isSelected = false
    }else
    {
        leftBtn.isSelected = false

    }
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
extension SHMineDingController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHDingdanCell.self)
        
        cell.addressLab.text = "地址：深圳市宝安福海街道海峰村4巷"
        
        cell.peopleLab.text = "联系人：李林哲 13756589954"
        cell.timeLab.text = "维修时间：2019-10-12"
        cell.tipLabel.text = "故障：电脑黑屏，系统奔溃"
        cell.baoxiuLab.text = "是否支付：未支付"
        cell.baoxiuLab.textColor = UIColor.red
        cell.statusLab.text = "订单状态：等待处理"
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
        navigationController?.pushViewController(vc, animated: true)
        
     
    }
    
    
}
