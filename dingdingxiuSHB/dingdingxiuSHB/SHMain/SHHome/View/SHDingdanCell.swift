//
//  SHDingdanCell.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHDingdanCell: SHBaseTableViewCell {

    lazy var  tipLabel :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        return t1
    }()
    
    lazy var yanyiLab : UILabel = {
        
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        t1.textAlignment = .right
        return t1
        
    }()
    lazy var  timeLab :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        return t1
    }()
    
    lazy var  baoxiuLab :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        return t1
    }()
    
    lazy var peopleLab : UILabel = {
        
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        t1.textAlignment = .right
        return t1
        
    }()
    
    lazy var  addressLab :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 17)
        return t1
    }()
    lazy var  statusLab :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.red
        t1.font = UIFont.systemFont(ofSize: 17)
        return t1
    }()
    
    override func configUI() {
        contentView.addSubview(tipLabel)
        contentView.addSubview(yanyiLab)
        contentView.addSubview(timeLab)
        contentView.addSubview(baoxiuLab)
        contentView.addSubview(peopleLab)
        contentView.addSubview(addressLab)
        contentView.addSubview(statusLab)
        
        tipLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        yanyiLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(tipLabel.snp_bottom).offset(10)
        }
        timeLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(yanyiLab.snp_bottom).offset(10)
        }
        baoxiuLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(timeLab.snp_bottom).offset(10)
        }
        peopleLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(baoxiuLab.snp_bottom).offset(10)
        }
        addressLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(peopleLab.snp_bottom).offset(10)
        }
        
        statusLab.snp.makeConstraints {
            $0.left.equalTo(tipLabel.snp_left).offset(0)
            $0.top.equalTo(addressLab.snp_bottom).offset(20)
        }
    }
    
}
