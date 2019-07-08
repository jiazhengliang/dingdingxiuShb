//
//  SHomeViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHomeViewController: SHBaseController {

    var contentView: SHAlertView!
    var backgroundStyle = JXPopupViewBackgroundStyle.blur
    var backgroundColor = UIColor.black.withAlphaComponent(0.3)
    var backgroundEffectStyle = UIBlurEffect.Style.light
    var animationIndex: Int = 0
    var containerView: UIView!
    private var subscribeList = [["name":"空调","pic":"list_kongtiao"],
                                 ["name":"电脑","pic":"list_diannao"],
                                 ["name":"冰箱","pic":"list_bingxiang"],
                                 ["name":"洗衣机","pic":"list_xiyiji"],
                                 ["name":"热水器","pic":"list_reshuiqi"],
                                 ["name":"燃气灶","pic":"list_ranqizao"],
                                 ["name":"油烟机","pic":"list_youyanji"],
                                 ["name":"消毒柜","pic":"list_xiaodugui"],
                                 ["name":"其他","pic":"list_qita"]]
    
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        
        lt.minimumLineSpacing = 10
        lt.minimumInteritemSpacing = 5
        
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout:lt)
        
        cw.backgroundColor = UIColor.clear
        cw.delegate = self
        cw.dataSource = self
        cw.alwaysBounceVertical = true
        cw.register(cellType: SHomeViewCell.self)
        cw.register(supplementaryViewType: SHComicCHead.self, ofKind: UICollectionView.elementKindSectionHeader)
        cw.register(supplementaryViewType: SHComicCFoot.self, ofKind: UICollectionView.elementKindSectionHeader)
        //        cw.uempty = UEmptyView { [weak self] in self?.loadData() }
        return cw
        
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "家电维修"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "wode"), style: .plain, target: self, action: #selector(rightBtnClick))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tuoguan"), style: .plain, target: self, action: #selector(LeftBtnClick))
        
        contentView = SHAlertView()
        
        if #available(iOS 11.0, *){
            collectionView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges)
        }
        collectionView.reloadData()
        let userdefaults = UserDefaults.standard
        
        let daTaSubList =  userdefaults.object(forKey: "daTaSubList")
        if daTaSubList == nil {
            
            userdefaults.set(["小草哥","男","13788889999","深圳后海大道101","70kg","173CM","二级工程师","维修家电"], forKey: "daTaSubList")
            
            userdefaults.synchronize()
        }
        
    }
    
    @objc func rightBtnClick(_: UIButton){
        
        print("点击了右键")
//
//        let mineVC = MineViewController()
//
//        self.navigationController?.pushViewController(mineVC, animated: true)
    }
    
    
    @objc func LeftBtnClick(_: UIButton){
        
        print("点击了右键")
        
//        let mineVC = DingDanController()
//        self.navigationController?.pushViewController(mineVC, animated: true)
    }
}

extension SHomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UCollectionViewSectionBackgroundLayoutDelegateLayout,AlertViewDelegate{
    
    func didClickButton(_ name: Int, type: String) {
        contentView.jx_popupView?.dismiss(animated: true, completion: nil)
        
        if type == "取消" {
        } else
        {
            
            print("D点击了\(name) ==\(type)")
//            let mineVC = OnlineViewController()
//            mineVC.yanyiLab.text = type
//            mineVC.nameLab.text =  contentView.titleLabel.text ?? "" + "：故障原因"
//            self.navigationController?.pushViewController(mineVC, animated: true)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return subscribeList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SHomeViewCell.self)
        let comicList = subscribeList[indexPath.row]
        cell.diction = comicList as NSDictionary
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 30.0) / 3.0)
        return CGSize(width: width, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        containerView = UIApplication.shared.keyWindow!
        let comicList = subscribeList[indexPath.row]
        contentView.titleLabel.text = comicList["name"] as! String
        
        
        displayPopupView()
        
    }
    
    func displayPopupView() {
        //- 确定contentView的目标frame
        contentView.frame = CGRect(x: 0, y: 0, width: screenWidth - 40, height: 380)
        contentView.delegate = self
        contentView.datearray = ["外观破损","按键失灵","不能开机","异响","指示灯异常","电路板问题","其他"]
        
        //- 确定动画效果
        contentView.center = view.center
        var animator: JXPopupViewAnimationProtocol?
        switch animationIndex {
        case 0:
            animator = JXPopupViewFadeInOutAnimator()
        case 1:
            animator = JXPopupViewZoomInOutAnimator()
        case 2:
            animator = JXPopupViewUpwardAnimator()
        case 3:
            animator = JXPopupViewDownwardAnimator()
        case 4:
            animator = JXPopupViewLeftwardAnimator()
        case 5:
            animator = JXPopupViewRightwardAnimator()
            
        default:
            break
        }
        let popupView = JXPopupView(containerView: containerView, contentView: contentView, animator: animator!)
        //配置交互
        popupView.isDismissible = true
        popupView.isInteractive = true
        //可以设置为false，再点击弹框中的button试试？
        //        popupView.isInteractive = false
        popupView.isPenetrable = false
        //- 配置背景
        popupView.backgroundView.style = self.backgroundStyle
        popupView.backgroundView.blurEffectStyle = self.backgroundEffectStyle
        popupView.backgroundView.color = self.backgroundColor
        popupView.display(animated: true, completion: nil)
    }
}

