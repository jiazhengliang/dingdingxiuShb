//
//  WaterCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
class WaterHeaderView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class WaterCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "我已分摊 232"
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = true
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
