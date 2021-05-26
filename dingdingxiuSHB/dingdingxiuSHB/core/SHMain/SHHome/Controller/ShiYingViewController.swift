//
//  ShiYingViewController.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
private let baseCellID = "baseCellID"

class ShiYingViewController: SHBaseController {

    var dataArr:[String] = ["sdflsjflsf","second","thirdsection","foursention","大幅度","鼎折覆餗"," 水电费","佛挡杀佛","水电费第三方士大夫","是","是"]
    var widthArr:[CGFloat] = []
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: PScreenWidth,height: 30)
        layout.scrollDirection = .vertical
        layout.sectionInset =  UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        let collectionView = UICollectionView(frame: CGRect.zero,collectionViewLayout: layout);
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TagViewCell.self, forCellWithReuseIdentifier: baseCellID)

//        collectionView.registerHeader(anyClass: TagSectionHeader.self)
//        collectionView.registerFooter(anyClass: TagSectionHeader.self)
        collectionView.alwaysBounceVertical = true
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for str in dataArr {
//
//            let width = str.calculateWidthWithFont(UIFont.systemFont(ofSize: 14))
//
//            widthArr.append(width + 20)
//        }
        dataArr.forEach { (str) in
            let width = str.calculateWidthWithFont(UIFont.systemFont(ofSize: 14))
            widthArr.append(width + 20)

        }
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ShiYingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 2 {
            return 0
        }
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: baseCellID, for: indexPath) as! TagViewCell

        cell.titleLabel.text = self.dataArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: widthArr[indexPath.row],height: 30)
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        if kind == UICollectionView.elementKindSectionHeader {
//            let headerV = collectionView.header(anyClass: TagSectionHeader.self, for: indexPath)
//            headerV.titleLabel.text = "头部\(indexPath.section)"
//            return headerV
//        }else {
//
//            let footerV = collectionView.header(anyClass: TagSectionHeader.self, for: indexPath)
//            footerV.titleLabel.backgroundColor = UIColor.red
//            footerV.titleLabel.text = "尾部\(indexPath.section)"
//            return footerV
//        }
//
//    }

}
