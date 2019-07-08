//
//  SHAlertView.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/6.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import XHToastSwift
protocol AlertViewDelegate: class {
    func didClickButton(_ name: Int , type:String)
}

class SHAlertView: UIView {
    
    weak var delegate: AlertViewDelegate?
    
    var seletBtn:UIButton?
    
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 20)
        tl.textColor = .init(r: 68, g: 77, b: 105)
        tl.textAlignment = .center
        return tl
    }()
    lazy var cancelBtn: UIButton = {
        let mn = UIButton(type: .system)
        mn.setTitle("取消", for: .normal)
        mn.setTitleColor(UIColor.lightGray, for: .normal)
        mn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        mn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        mn.tag = 10;
        mn.layer.borderColor = UIColor.init(r: 68, g: 77, b: 105).cgColor
        mn.layer.borderWidth = 1;
        mn.layer.cornerRadius = 5;
        mn.layer.masksToBounds = true
        return mn
    }()
    lazy var subBtn: UIButton = {
        let mn = UIButton(type: .system)
        mn.setTitle("提交", for: .normal)
        mn.setTitleColor(UIColor.white, for: .normal)
        mn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        mn.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
        mn.tag = 20;
        mn.backgroundColor = UIColor.init(r: 68, g: 77, b: 105)
        mn.layer.borderColor = UIColor.lightGray.cgColor
        mn.layer.cornerRadius = 5;
        mn.layer.masksToBounds = true
        return mn
    }()
    @objc func moreAction(button: UIButton) {
        
        
        if button.tag == 20 {
            if seletBtn == nil {
                window?.showXHToastCenterWithText("请选择")
                return
            }
            guard var type = seletBtn?.titleLabel?.text else { return  }
            
            delegate?.didClickButton(seletBtn?.tag ?? 0,type: type)
        } else
        {
            delegate?.didClickButton(seletBtn?.tag ?? 0,type: "取消")
            
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        addSubview(cancelBtn)
        addSubview(subBtn)
        titleLabel.text = "故障类型"
        titleLabel.frame = CGRect(x: 0, y: 20, width: screenWidth - 40, height: 40)
        cancelBtn.frame = CGRect(x: (screenWidth/2 - 20 - 130)/2, y: 290, width: 130, height: 50)
        
        subBtn.frame = CGRect(x:  (screenWidth/2 - 20 - 130)/2 + screenWidth/2 - 20 , y: 290, width:130, height: 50)
        
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let heigth:CGFloat = 45
    let width:CGFloat = screenWidth/2 - 20
    
    
    var datearray : NSArray? {
        didSet {
            guard let datearray = datearray else { return }
            
            let chilrenviews = subviews
            
            for chilren in chilrenviews {
                
                if chilren.tag > 99 && chilren.isKind(of: UIButton.classForCoder()){
                    chilren.removeFromSuperview()
                    print("消费了\(chilren.tag)\(chilren.classForCoder)")
                }
                
            }
            
            var row:Int = 0
            
            for (index ,value) in datearray.enumerated(){
                
                //                print(datearray[index as! Int])
                print("\(index)"+"\(value)")
                
                let sub1 = UIButton()
                sub1.setTitle(value as! String, for: .normal)
                
                sub1.setTitleColor(UIColor.lightGray, for: .normal)
                sub1.tag  = index + 100
                sub1.setImage(UIImage.init(named: "alter_select_nor"), for: .normal)
                sub1.setImage(UIImage.init(named: "alter_select_hor"), for: .selected)
                
                addSubview(sub1)
                
                if index%2 == 0 {
                    row = row + 1
                }
                let x:CGFloat =  (width ) * CGFloat(index%2)
                let y:CGFloat =   (heigth ) * CGFloat(row) + 30
                
                sub1.frame = CGRect(x: x, y: y, width: width, height: heigth)
                sub1.addTarget(self, action: #selector(didseleBtn), for: .touchUpInside)
                
                
            }
            
        }
        
    }
    
    @objc func didseleBtn(button: UIButton) {
        
        seletBtn?.isSelected = false
        button.isSelected = true
        print("点击了第几个\(button.tag)")
        seletBtn = button
    }
}
