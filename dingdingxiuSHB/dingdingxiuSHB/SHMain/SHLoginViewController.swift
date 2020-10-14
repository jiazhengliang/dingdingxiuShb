//
//  SHLoginViewController.swift
//  dingdingxiuSHB
//
//  Created by mac on 2019/7/13.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
import SwiftyJSON
import SwiftUI
class SHLoginViewController: SHBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.init(r: 234, g: 234, b: 234)
        
//        if  passWordString == "8888" && phoneString == "13288889999"{

        
        // Do any additional setup after loading the view.
    }
    
   
    lazy  var infoArray:NSMutableArray = {
        let array = NSMutableArray()
        
        return array
    }()
    
    
    lazy var headerView:UIView = {
        
        let image = UIView()
        image.backgroundColor = UIColor.init(r: 68, g: 77, b: 105);
        
        return image
        
        
    }()
    
    lazy var headerIcon:UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage.init(named: "touxiang");
        
        return image
        
    }()
    
    lazy var titleLabel:UILabel = {
        
        let image = UILabel()
        image.textColor = UIColor.white
        image.font = UIFont.systemFont(ofSize: 14)
        image.text = "已有账号密码？登录"
        
        return image
        
    }()
    
    
    lazy var mainView:UIView = {
        
        let image = UIView()
        image.backgroundColor = UIColor.white;
        
        return image
        
    }()
    
    lazy var loginLabl:UIButton = {
        let lab = UIButton()
        lab.setTitleColor(UIColor.init(r: 68, g: 77, b: 105), for: .selected)
        lab.setTitleColor(UIColor.init(r: 149, g: 159, b: 179), for: .normal)
        lab.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        lab.titleLabel?.textAlignment = .center
        lab.setTitle("登录", for: .normal)
        lab.isSelected = true
        
        lab.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        
        return lab
    }()
    
    lazy var resigLabl:UIButton = {
        let lab = UIButton()
        lab.setTitleColor(UIColor.init(r: 149, g: 159, b: 179), for: .normal) ;
        lab.setTitleColor(UIColor.init(r: 68, g: 77, b: 105), for: .selected) ;
        
        lab.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        lab.titleLabel?.textAlignment = .center
        lab.setTitle("注册", for: .normal)
        lab.isSelected = false
        lab.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return lab
    }()
    
    lazy var lineView:UIView = {
        
        let image = UIView()
        image.backgroundColor = UIColor.init(r: 68, g: 77, b: 105);
        image.alpha = 0.5
        return image
        
    }()
    
    lazy var loginBackgView :UIView = {
        let image = UIView()
        image.isHidden = false
        return image
    }()
    
    
    
    lazy var phonetext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "请输入手机号"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    lazy var passWordtext:UITextField = {
        
        let text = UITextField()
        text.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        text.placeholder = "请输入密码"
        
        text.clearButtonMode = .whileEditing
        text.borderStyle = .roundedRect
        
        return text
        
    }()
    
    
    lazy var resignBackgView :UIView = {
        let image = UIView()
        image.isHidden = true
        return image
    }()
    
    lazy var phoneResigntext:UITextField = {
        
        let image = UITextField()
        image.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        image.placeholder = "手机号"
        
        image.clearButtonMode = .whileEditing
        image.keyboardType = UIKeyboardType.numberPad
        image.borderStyle = .roundedRect
        
        return image
        
    }()
    
    lazy var passResignWordtext:UITextField = {
        
        let text = UITextField()
        text.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        text.placeholder = "密码"
        
        text.clearButtonMode = .whileEditing
        text.borderStyle = .roundedRect
        
        return text
        
    }()
    
    lazy var resignNiketext:UITextField = {
        
        let text = UITextField()
        text.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        text.placeholder = "您的称呼"
        
        text.clearButtonMode = .whileEditing
        text.borderStyle = .roundedRect
        
        return text
        
    }()
    
    
    lazy var resignAddtext:UITextField = {
        
        let text = UITextField()
        text.backgroundColor = UIColor.init(r: 235, g: 240, b: 245);
        text.placeholder = "详细地址"
        text.clearButtonMode = .whileEditing
        text.borderStyle = .roundedRect
        return text
        
    }()
    
    lazy var submitBtn:UIButton = {
        let subBtn = UIButton()
        subBtn.backgroundColor = UIColor.init(r: 68, g: 77, b: 105)
        subBtn.setTitleColor(UIColor.white, for: .normal) ;
        subBtn.layer.cornerRadius  = 5
        subBtn.layer.masksToBounds = true
        subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        subBtn.titleLabel?.textAlignment = .center
        subBtn.setTitle("登录", for: .normal)
        subBtn.isSelected = false
        subBtn.addTarget(self, action: #selector(subBtnClick), for: .touchUpInside)
        return subBtn
    }()
    
    lazy var resignBtn:UIButton = {
        let subBtn = UIButton()
        subBtn.backgroundColor = UIColor.init(r: 68, g: 77, b: 105)
        subBtn.setTitleColor(UIColor.white, for: .normal) ;
        subBtn.layer.cornerRadius  = 5
        subBtn.layer.masksToBounds = true
        subBtn.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        subBtn.titleLabel?.textAlignment = .center
        subBtn.setTitle("注册", for: .normal)
        subBtn.isSelected = false
        subBtn.addTarget(self, action: #selector(resignBtnClick), for: .touchUpInside)
        return subBtn
    }()
    
    @objc func loginBtnClick(button: UIButton) {
        
        if button == loginLabl {
            resigLabl.isSelected = false
            loginLabl.isSelected = true
            loginBackgView.isHidden = false
            resignBackgView.isHidden = true
            print("点击了登录")
        } else
        {
            print("点击了注册")
            loginBackgView.isHidden = true
            resignBackgView.isHidden = false
            resigLabl.isSelected = true
            loginLabl.isSelected = false
        }
    }
    //MARK: 登录
    @objc func subBtnClick(button: UIButton) {
        
        let phoneString = phonetext.text
        let passWordString = passWordtext.text
        print("点击了登录\(phoneString!.count)==\(phoneString)")
        
        if phoneString!.count < 10 {
            view.showXHToastCenterWithText("请输入手机号")
            return
        }
        
        if passWordString!.count < 3 {
            view.showXHToastCenterWithText("请输入密码")
            return
        }
        print("点击了登录")
        
//        SVProgressHUD.show()
        
        if  passWordString == "8888" && phoneString == "13288889999"{
            self.perform(#selector(loadData), with: nil, afterDelay: 1.0)

        } else
        {
            
            SVProgressHUD.dismiss()
            view.showXHToastCenterWithText("账号或者密码错误")
            
        
        }
    }
    
    
    @objc func resignBtnClick(button: UIButton) {
        
        let phoneString = phoneResigntext.text
        let passWordString = passResignWordtext.text
        let nickString = resignNiketext.text
        
        let addtring = resignAddtext.text
        
        print("点击了登录\(phoneString!.count)==\(phoneString)")
        
        if phoneString!.count < 10 {
            view.showXHToastCenterWithText("请输入手机号")
            return
        }
        
        if passWordString!.count < 3 {
            view.showXHToastCenterWithText("请输入密码")
            return
        }
        if nickString!.count < 1 {
            view.showXHToastCenterWithText("请输入昵称")
            return
        }
        if addtring!.count < 1 {
            view.showXHToastCenterWithText("请输入地址")
            return
        }
        print("点击了登录")
        
        SVProgressHUD.show()
        self.perform(#selector(delayResignClick), with: nil, afterDelay: 1.0)
    }
    
    
    @objc func delayClick() {
        SVProgressHUD.dismiss()
        view.showXHToastCenterWithText("登录成功了")
    }
    
    //MARK: 登录成功
    @objc private func loadData()
    {
        let urlStr = "http://192.168.11.171:8080/dg-mall-news/headline/home-address/queryArea"
        
        Alamofire.request(urlStr,method: .post).responseJSON { (response) in
            switch response.result{
            case .success(let json):
                let tResult = json as! NSDictionary

                if let jsonss = response.result.value {
                    let model = jsonModel()
                    let jsonDict = JSON(json)
                    model.resultCode = jsonDict["resultCode"].string ?? ""
                    

                    
                    
                    for i in 0..<jsonDict["result"].count  {
                        
                        let subModel = Content()
                        
                        let subDic = jsonDict["result"][i]
                        
                        subModel.fd_area_name = subDic["fd_area_name"].string ?? ""
                        subModel.fd_area_code = subDic["fd_area_code"].int!

                       
                        self.infoArray.add(subModel)
                        print(subModel.fd_area_name)
                    }
                    
                    print(self.infoArray)

                    let subModel:Content = self.infoArray[3] as! Content
                    
                    print(subModel.fd_area_name)
                }
                    //                    model.result = jsonDict["result"]
                do{
                    print(tResult)
                    let jsonData = try JSONSerialization.data(withJSONObject: tResult  as Any, options: [])
                    let jsonModels = try JSONDecoder().decode(jsonModel.self, from: jsonData)
                    print("-----------------")
                    print(jsonModels)
                    
                    var submodel = jsonModels.result![2];
                    
                    print(submodel.fd_area_name)

                    print("-----------------")
                    
                }catch{
                    print(error)
                }
              
                    
//                }
            
               
                
                

                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
            
                

//                let shares = try JSONDecoder().decode([Share].self, from: jsonData)
                
//                let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.window?.rootViewController = SHTabBarController()
//
//                appDelegate.window?.makeKeyAndVisible()
                break
                
            case .failure(let error):
                print("error:\(error)")
                
                break
            }
        }
        
//        self.loadDataByAFN()
        
        
//        ApiLoadingProvider.request(.searchHot, model: SubscribeListModel.self) { (returnData) in
//                SVProgressHUD.dismiss()
//
//            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = SHTabBarController()
//
//            appDelegate.window?.makeKeyAndVisible()
////                UIApplication.shared.window?.rootViewController = NavigationBaseController(rootViewController: HomeViewController())
////                window?.makeKeyAndVisible()
//            }
//

        

    }
    
    /// 类AFN请求
    func loadDataByAFN() {
        let urlStr = "http://192.168.11.171:8080/dg-mall-news/headline/home-address/queryArea"

        NetworkTools.POST(url: urlStr, params: nil, success: { (json) in
            let decoder = JSONDecoder()
            
            
//            let model = try? decoder.decode(DMModel.self, from: json)
            
            print("json:\(json)")
//                self.model = model
        
        }) { (state_code, message) in
            
        }
    }
    @objc func delayResignClick() {
        SVProgressHUD.dismiss()
        view.showXHToastCenterWithText("注册成功了,等待系统审核")
    }
    override func configUI() {
        view.addSubview(headerView)
        
        phonetext.text = "13288889999"
        passWordtext.text = "8888"
//        if  passWordString == "8888" && phoneString == "13288889999"{

        headerView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
        }
        
        headerView.addSubview(headerIcon)
        
        headerIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.height.width.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(headerIcon.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(headerView.snp.bottom).offset(-10)
        }
        
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.right.equalTo(headerView.snp.right).offset(-10)
            $0.left.equalTo(headerView.snp.left).offset(10)
            $0.bottom.equalToSuperview()
        }
        
        mainView.addSubview(loginLabl)
        let width = floor(Double(screenWidth - 20.0) / 2.0)
        
        loginLabl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(44)
        }
        mainView.addSubview(resigLabl)
        
        resigLabl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview()
            $0.width.equalTo(width)
            $0.height.equalTo(44)
        }
        
        mainView.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(resigLabl.snp_bottom).offset(1)
            $0.right.left.equalToSuperview()
            $0.height.equalTo(1)
        }
        mainView.addSubview(loginBackgView)
        
        loginBackgView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp_bottom).offset(0)
            $0.right.left.bottom.equalToSuperview()
        }
        
        loginBackgView.addSubview(phonetext)
        
        phonetext.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        
        loginBackgView.addSubview(passWordtext)
        
        passWordtext.snp.makeConstraints {
            $0.top.equalTo(phonetext.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        loginBackgView.addSubview(submitBtn)
        
        submitBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(55)
        }
        mainView.addSubview(resignBackgView)
        
        resignBackgView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp_bottom).offset(0)
            $0.right.left.bottom.equalToSuperview()
        }
        
        resignBackgView.addSubview(phoneResigntext)
        
        phoneResigntext.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        resignBackgView.addSubview(passResignWordtext)
        
        passResignWordtext.snp.makeConstraints {
            $0.top.equalTo(phoneResigntext.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        resignBackgView.addSubview(resignNiketext)
        
        resignNiketext.snp.makeConstraints {
            $0.top.equalTo(passResignWordtext.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        
        resignBackgView.addSubview(resignAddtext)
        
        resignAddtext.snp.makeConstraints {
            $0.top.equalTo(resignNiketext.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.height.equalTo(55)
        }
        
        resignBackgView.addSubview(resignBtn)
        
        resignBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(55)
        }
    }
    
    
}
