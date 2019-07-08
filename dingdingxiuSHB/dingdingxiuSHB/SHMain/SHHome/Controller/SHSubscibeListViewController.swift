//
//  SHSubscibeListViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHSubscibeListViewController: SHBaseController {

    
    private var subscribeList = [ComicListModel]()
    
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        
        lt.minimumLineSpacing = 10
        lt.minimumInteritemSpacing = 5
        
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout:lt)
        
        cw.backgroundColor = UIColor.clear
        cw.delegate = self
        cw.dataSource = self
        cw.alwaysBounceVertical = true
        cw.register(cellType: SHComicCCell.self)
        cw.register(supplementaryViewType: SHComicCHead.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.register(supplementaryViewType: SHComicCFoot.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return cw
        
        
    }()
    
    private func loadData()
    {
        ApiLoadingProvider.request(.subscribeList, model: SubscribeListModel.self) { (returnData) in
            self.collectionView.uempty?.allowShow = true
            self.subscribeList = returnData?.newSubscribeList ?? []
            self.collectionView.reloadData()
        }
    }
    
    override func configUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 11.0, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        loadData()
    }
}

extension SHSubscibeListViewController:UICollectionViewDelegate,UICollectionViewDataSource,UCollectionViewSectionBackgroundLayoutDelegateLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return subscribeList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let comicList = subscribeList[section]
        return comicList.comics?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SHComicCCell.self)
        cell.style = .withTitle
        let comicList = subscribeList[indexPath.section]
        cell.model = comicList.comics?[indexPath.row]
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 10.0) / 3.0)
        return CGSize(width: width, height: 240)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let comicList = subscribeList[indexPath.section]
        //        guard let model = comicList.comics?[indexPath.row] else { return }
        //        let vc = UComicViewController(comicid: model.comicId)
        //        navigationController?.pushViewController(vc, animated: true)
    }
}
