//
//  TagViewCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class TagViewCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.backgroundColor = .groupTableViewBackground
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 14)
        l.layer.cornerRadius = 15
        
        return l
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
