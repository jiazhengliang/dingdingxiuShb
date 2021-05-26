//
//  HJCollectionViewCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class HJCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hj_setupViews()
        hj_bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hj_setupViews()
        hj_bindViewModel()
    }
    
    
}

extension HJCollectionViewCell : HJCollectionCellProtocol {
    
    @objc func hj_setupViews() {
        
    }
    
    @objc func hj_bindViewModel() {
        
    }
    
}

protocol HJCollectionCellProtocol {
    
    /// 设置界面
    func hj_setupViews()
    
    /// 绑定viewModel
    func hj_bindViewModel()
}

