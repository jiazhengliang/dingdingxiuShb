//
//  HJHomeTableViewCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import Kingfisher

class HJHomeTableViewCell: HJTableViewCell {
    
    var viewModel: HJTableCollectionCellViewModel? {
        
        didSet {
            let url = URL(string: viewModel?.headerImageStr ?? "")
            headerImageView.kf.setImage(with: url)
            
            nameLabel.text = viewModel?.name
            articleLabel.text = viewModel?.articleNum
            peopleNumLabel.text = viewModel?.peopleNum
            contentLabel.text = viewModel?.content
        }
        
    }
    
    lazy var headerImageView: UIImageView = {
        let headerView = UIImageView()
        headerView.backgroundColor = UIColor.gray
        return headerView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLbl = UILabel()
        nameLbl.font = UIFont.systemFont(ofSize: 14)
        nameLbl.textColor = UIColor.black
        return nameLbl
    }()
    
    lazy var articleImageView: UIImageView = {
        let articleView = UIImageView()
        articleView.backgroundColor = UIColor.green
        return articleView
    }()
    
    lazy var articleLabel: UILabel = {
        let articleLbl = UILabel()
        articleLbl.font = UIFont.systemFont(ofSize: 12)
        articleLbl.textColor = UIColor.black
        return articleLbl
    }()
    
    lazy var peopleImageView: UIImageView = {
        let peopleView = UIImageView()
        peopleView.backgroundColor = UIColor.yellow
        return peopleView
    }()
    
    lazy var peopleNumLabel: UILabel = {
        let peopleNumLbl = UILabel()
        peopleNumLbl.font = UIFont.systemFont(ofSize: 12)
        peopleNumLbl.textColor = UIColor.black
        return peopleNumLbl
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLbl = UILabel()
        contentLbl.font = UIFont.systemFont(ofSize: 14)
        contentLbl.textColor = UIColor.black
        return contentLbl
    }()
    
    lazy var lineImageView: UIImageView = {
        let lineView = UIImageView()
        lineView.backgroundColor = UIColor.black
        return lineView
    }()
    
    override func updateConstraints() {
        let paddingEdge = 10
        
        headerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(paddingEdge)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerImageView.snp_right).offset(paddingEdge)
            make.top.equalTo(headerImageView)
            make.right.equalTo(contentView).offset(-paddingEdge)
            make.height.equalTo(15)
        }
        
        articleImageView.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalTo(nameLabel.snp.bottom).offset(paddingEdge)
        }
        
        articleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(articleImageView.snp.right).offset(3)
            make.size.equalTo(CGSize(width: 50, height: 15))
            make.centerY.equalTo(articleImageView)
        }

        peopleImageView.snp.makeConstraints { (make) in
            make.left.equalTo(articleLabel.snp_right).offset(paddingEdge)
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.centerY.equalTo(articleImageView)
        }

        peopleNumLabel.snp.makeConstraints { (make) in
            make.left.equalTo(peopleImageView.snp_right).offset(3)
            make.centerY.equalTo(peopleImageView)
            make.size.equalTo(CGSize(width: 50, height: 15))
        }

        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(articleImageView.snp_bottom).offset(paddingEdge)
            make.left.equalTo(articleImageView)
            make.right.equalTo(contentView).offset(-paddingEdge)
            make.height.equalTo(15)
        }

        lineImageView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(contentView)
            make.height.equalTo(1.0)
        }
        
        super.updateConstraints()
    }
    
    
    override func hj_setupViews() {
        
        contentView.addSubview(headerImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(articleImageView)
        contentView.addSubview(articleLabel)
        contentView.addSubview(peopleImageView)
        contentView.addSubview(peopleNumLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(lineImageView)
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()

    }
    
    override func hj_bindViewModel() {
        
    }
}
