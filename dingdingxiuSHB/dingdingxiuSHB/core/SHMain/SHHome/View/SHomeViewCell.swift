//
//  SHomeViewCell.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHomeViewCell: SHBaseCollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .center
        iw.backgroundColor = UIColor.init(r: 235, g: 240, b: 245)
        iw.clipsToBounds = true
        iw.layer.cornerRadius = 40;
        iw.image = UIImage.init(named: "list_kongtiao")
        return iw
    }()
    
    private lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.black
        tl.font = UIFont.systemFont(ofSize: 14)
        return tl
    }()
    
    override func configUI() {
        
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            
            $0.top.equalToSuperview().offset(10)
            $0.size.equalTo(CGSize(width: 80, height: 80))
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(25)
            $0.top.equalTo(iconView.snp_bottom).offset(10)
        }
        
    }
    
    var diction: NSDictionary? {
        
        didSet {
            guard let diction = diction else { return }
            print("4444\(diction["name"])")
            titleLabel.text = diction["name"] as! String
            iconView.image = UIImage.init(named:diction["pic"] as! String)
            
        }
    }
    
}
