//
//  HJTableViewCell.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class HJTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        /// 设置界面
        hj_setupViews()
        hj_bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /// 设置界面
        hj_setupViews()
        hj_bindViewModel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

extension HJTableViewCell : HJTableCellProtocol {
    
    @objc func hj_setupViews() {
        
    }
    
    @objc func hj_bindViewModel() {
        
    }
    
}

protocol HJTableCellProtocol {
    
    /// 设置界面
    func hj_setupViews()
    
    /// 绑定viewModel
    func hj_bindViewModel()
}
