//
//  WaterFlowController.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class WaterFlowController: SHBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectView)
        collectView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        // Do any additional setup after loading the view.
    }
    
    lazy var collectView:UICollectionView = {
        let layout = WaterfallLayout()
        layout.headerReferenceSize = CGSize(width: PScreenWidth, height: 120)
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.scrollDirection = .vertical
        let v = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .groupTableViewBackground
        v.delegate = self
        v.dataSource = self
        v.register(WaterCell.self, forCellWithReuseIdentifier: "WaterCell")

//        v.registerHeader(anyClass: WaterHeaderView.self)
//        v.registerCell(anyClass: WaterCell.self)
        v.alwaysBounceVertical = true
        return v
    }()
    private var picWidth  = (PScreenWidth - 12*2 - 6)/2

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WaterFlowController :UICollectionViewDelegate,UICollectionViewDataSource,WaterfallLayoutDelegate{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WaterCell", for: indexPath) as! WaterCell

        cell.titleLabel.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let randomHeight = (100 + (arc4random() % (300 - 100 + 1)))
        return CGSize(width: picWidth, height:CGFloat(randomHeight))
        
    }
    

    
    
    
}

