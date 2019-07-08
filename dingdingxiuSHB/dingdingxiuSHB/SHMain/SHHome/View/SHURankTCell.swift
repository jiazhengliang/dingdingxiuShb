//
//  SHURankTCell.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHURankTCell: SHBaseTableViewCell {

        
        lazy var iconView: UIImageView =
            {
                let iw = UIImageView()
                iw.contentMode = .scaleAspectFill
                
                iw.clipsToBounds = true
                return iw
        }()
        
        lazy var titleLabel:UILabel = {
            let t1 = UILabel()
            t1.textColor = UIColor.black
            t1.font = UIFont.systemFont(ofSize: 18)
            
            return t1
        }()
        
        lazy var descLabel:UILabel  = {
            let d1 = UILabel()
            d1.textColor = UIColor.gray
            d1.numberOfLines = 0
            d1.font = UIFont.systemFont(ofSize: 15)
            return d1
        }()
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func configUI() {
            let line = UIView().then {
                $0.backgroundColor = UIColor.background
            }
            contentView.addSubview(line)
            line.snp.makeConstraints {
                $0.left.top.bottom.equalToSuperview()
                $0.height.equalTo(10)
            }
            contentView.addSubview(iconView)
            iconView.snp.makeConstraints {
                $0.left.top.equalToSuperview().offset(10)
                $0.bottom.equalToSuperview().offset(-10)
                $0.width.equalToSuperview().multipliedBy(0.5)
            }
            contentView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints {
                $0.left.equalTo(iconView.snp.right).offset(10)
                $0.right.equalToSuperview().offset(-10)
                $0.height.equalTo(30)
                $0.top.equalTo(iconView).offset(20)
            }
            
            contentView.addSubview(descLabel)
            descLabel.snp.makeConstraints {
                $0.left.equalTo(iconView.snp.right).offset(10)
                $0.right.equalToSuperview().offset(-10)
                $0.top.equalTo(titleLabel.snp.bottom).offset(10)
                $0.bottom.equalTo(iconView)
            }
            
            
        }
        
        var model:RankingModel?{
            
            didSet{
                guard let model = model else {
                    return
                }
                iconView.kf.setImage(urlString: model.cover)
                titleLabel.text = "\(model.title ?? "")榜"
                descLabel.text = model.subTitle
            }
        }
        
}
