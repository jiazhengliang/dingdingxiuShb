//
//  HJHomeTableSectionView.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
class HJHomeTableSectionView: SHView {

    
    var viewModel: HJSectionHeaderViewModel
    
    lazy var backgroundView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        return bgView
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    lazy var lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.darkGray
        return imageView
    }()
    
    init(viewModel: HJSectionHeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp_left).offset(10)
            make.centerY.equalTo(self)
        }
        
        lineImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom)
        }
        
        super.updateConstraints()
    }
    
    override func hj_setupViews() {
        addSubview(self.backgroundView)
        addSubview(self.titleLabel)
        addSubview(self.lineImageView)
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func hj_bindViewMode() {
        
        viewModel.relay.subscribe { [weak self] (event) in
            self?.titleLabel.text = event.element
        }.disposed(by: self.dispoaseBag)
        
    }
    

}
