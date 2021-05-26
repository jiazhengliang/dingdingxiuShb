//
//  SHMineTabCell.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHMineTabCell: SHBaseTableViewCell {

    
    lazy var  tipLabel :UILabel = {
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 14)
        return t1
    }()
    
    lazy var subLab : UILabel = {
        
        let t1 = UILabel()
        t1.textColor = UIColor.gray
        t1.font = UIFont.systemFont(ofSize: 13)
        t1.textAlignment = .right
        return t1
        
    }()
    
    override func configUI() {
        contentView.addSubview(tipLabel)
        contentView.addSubview(subLab)
        
        tipLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }
        
        subLab.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-30)
            $0.centerY.equalToSuperview()
        }
    }
    
}
