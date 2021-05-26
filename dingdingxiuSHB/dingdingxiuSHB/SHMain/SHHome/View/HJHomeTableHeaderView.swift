//
//  HJHomeTableHeaderView.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/25.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
class HJHomeTableHeaderView: SHView {

    
    var viewModel: HJTableViewHeaderViewModel
    
    var collectionView: UICollectionView?
    
    var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        return flowLayout
    }()
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    init(frame: CGRect, viewModel: HJTableViewHeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        let margin: Int = 10
        bgView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.bottom.equalTo(self.snp_bottom).offset(-margin)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(self).offset(margin)
            make.height.equalTo(20)
        }
        if let collectionView = collectionView {
            collectionView.snp.makeConstraints { (make) in
                make.left.right.equalTo(self)
                make.bottom.equalTo(self.snp_bottom).offset(-margin)
                make.top.equalTo(self.titleLabel.snp_bottom).offset(margin)
            }
        }
        
        super.updateConstraints()
    }
    
    override func hj_setupViews() {
        
        addSubview(bgView)
        addSubview(titleLabel)
        
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        
        if let collectionView = collectionView {
            
            collectionView.collectionViewLayout = flowLayout
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = UIColor.white
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.register(HJHomeCollectionCell.self, forCellWithReuseIdentifier: NSStringFromClass(HJHomeCollectionCell.self))
            addSubview(collectionView)
            
        }
        
    }
    
    override func hj_bindViewMode() {
        viewModel.refreshUISubject.observeOn(MainScheduler.instance).subscribe { [weak self] (event) in
            print("collection view reload data \(Thread.current)")
            
            self?.collectionView?.reloadData()
        }.disposed(by: self.dispoaseBag)
        
        viewModel.relay.subscribe { [weak self] (event) in
            self?.titleLabel.text = event.element
        }.disposed(by: self.dispoaseBag)
    }
}

extension HJHomeTableHeaderView : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HJHomeCollectionCell.self), for: indexPath) as! HJHomeCollectionCell
        if viewModel.dataArray.count == indexPath.item {
            cell.type = "加入新圈子"
        }
        if viewModel.dataArray.count > indexPath.item {
            cell.viewModel = viewModel.dataArray[indexPath.item]
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.cellClickSubject.onNext(indexPath)
    }
    
}
