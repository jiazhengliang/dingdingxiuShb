//
//  SHTabBarController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/7.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class SHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false

        
        /// 分类
        let classVC = SHListController()
        addChildViewController(classVC,
                               title: "广场",
                               image: UIImage(named: "tabbar_nor_1"),
                               selectedImage: UIImage(named: "tabbar_hor_1"))
        
        
        /// 书架
        let bookVC = SHMineDingController()
        addChildViewController(bookVC,
                               title: "任务",
                               image: UIImage(named: "tabbar_nor_2"),
                               selectedImage: UIImage(named: "tabbar_hor_2"))
        
        
        /// 我的
        let mineVC = SHMineViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tabbar_nor_3"),
                               selectedImage: UIImage(named: "tabbar_hor_3"))
        
        // Do any additional setup after loading the view.
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        let item = UITabBarItem(title: title,
                                          image: image?.withRenderingMode(.alwaysOriginal),
                                          selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
//        item.
        var attributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 220.0/255.0, green: 104.0/255.0, blue: 1.0/255.0, alpha: 1.0),
                           NSAttributedString.Key.font: UIFont(name: "Heiti SC", size: 24.0)!]
        item.setTitleTextAttributes(attributes , for: .selected)

        childController.tabBarItem = item
        
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
        addChild(UINavigationController(rootViewController: childController))
    }
    

}
extension SHTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
