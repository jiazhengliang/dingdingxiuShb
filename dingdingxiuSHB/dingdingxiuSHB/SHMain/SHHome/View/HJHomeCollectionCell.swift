//
//  HJHomeCollectionCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import Kingfisher

class HJHomeCollectionCell: HJCollectionViewCell {
    
    
    var viewModel: HJTableCollectionCellViewModel? {
        didSet {
            print("collection cell set view model")
            let url = URL(string: viewModel?.headerImageStr ?? "")
            headerImageView.kf.setImage(with: url)
            nameLabel.text = viewModel?.name
        }
    }
    
    /// 加入新圈子
    var type: String? {
        didSet {
            headerImageView.image = UIImage(named: "circle_plus.png")
            nameLabel.text = type
        }
    }


    lazy var headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.backgroundColor = UIColor.gray
        return headerImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func updateConstraints() {
        
        let paddingEdge = 10
        
        headerImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headerImageView.snp_bottom).offset(paddingEdge)
            make.height.equalTo(15)
            make.left.right.equalTo(headerImageView)
        }
        
        super.updateConstraints()
    }
    
    override func hj_setupViews() {
        contentView.addSubview(headerImageView)
        contentView.addSubview(nameLabel)
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func hj_bindViewModel() {
        
    }

}
