//
//  SHBaseController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/6/29.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class SHBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
            
        }
        configUI()
        
        // Do any additional setup after loading the view.
    }
    
    func configUI() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    func configNavigationBar() {
        
        guard let navi = navigationController else {
            return;
        }
        if navi.visibleViewController == self {
            navi.setNavigationBarHidden(false, animated: true)
            
            if navi.viewControllers.count > 1{
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: .plain, target: self, action: #selector(pressBack))
                tabBarController?.hidesBottomBarWhenPushed = true;
            }else
            {
                tabBarController?.hidesBottomBarWhenPushed = false;
            }
        }
        
        
    }
    
    
    @objc func pressBack()  {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
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

extension SHBaseController{
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
