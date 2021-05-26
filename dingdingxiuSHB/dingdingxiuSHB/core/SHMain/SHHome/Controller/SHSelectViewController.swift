//
//  SHSelectViewController.swift
//  dingdingxiuSHB
//
//  Created by jones on 2020/10/15.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class person {
    var name:String

    init(name:String) {
        self.name = name
    }

    deinit {
        print("xiaofeile niminhaoshu")
        
    }
    func printname(){
        print(name)
    }
    
    func play1(param:String ,param2:(_ datasss:String) -> Void) -> Void {
         param2(param + "---swift")
    }
    
    
}
class SHSelectViewController: SHBaseController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "地址选择"
        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *){
            tableView.contentInsetAdjustmentBehavior = .never
        } else
        {
            automaticallyAdjustsScrollViewInsets = false
        }
        getData(code: "35", type: 0)
        configUI()

    }
    var type : NSString?
    
    lazy var tableView : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.white
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHMineTabCell.self)
        return tab
    }()
    lazy var tableView2 : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.red
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHMineTabCell.self)
        return tab
    }()
    
    lazy var tableView3 : UITableView  = {
        
        let tab = UITableView(frame: view.bounds, style: .plain)
        tab.backgroundColor = UIColor.yellow
        tab.delegate = self;
        tab.dataSource = self
        tab.register(cellType: SHMineTabCell.self)
        return tab
    }()
    
    lazy  var daTaSubList:NSMutableArray = {
        let array = NSMutableArray()
        
        return array
    }()
    lazy  var daTaSubList2:NSMutableArray = {
        let array = NSMutableArray()
        
        return array
    }()
    lazy  var daTaSubList3:NSMutableArray = {
        let array = NSMutableArray()
        
        return array
    }()
    lazy var hederView : UIView  = {
        
        let tab = UIView()
        tab.backgroundColor = UIColor.colorWithRGBA(r: 233, g: 233, b: 233, a: 1);

        return tab
    }()
    lazy var titlLab : UILabel  = {
        
        let tab = UILabel()
        tab.text = "请选择"
        tab.textColor = UIColor.red;
        tab.font = UIFont.systemFont(ofSize: 14);
        return tab
    }()

    

    override func configUI() {
        view.addSubview(tableView)
        view.addSubview(tableView2)

        view.addSubview(tableView3)

        view.addSubview(hederView)
        hederView.snp.makeConstraints {
            $0.right.left.equalToSuperview().offset(0)
            $0.top.equalToSuperview().offset(navigationHeight)

            $0.height.equalTo(44)
        }
        tableView.snp.makeConstraints {
            $0.right.left.bottom.equalToSuperview().offset(0)
            $0.top.equalTo(hederView.snp.bottom).offset(10)

        }
        
        tableView2.snp.makeConstraints {
            $0.right.bottom.equalToSuperview().offset(0)
            $0.left.equalTo(tableView.snp.left).offset(screenWidth/3)

            $0.top.equalTo(hederView.snp.bottom).offset(10)

        }
        
        tableView3.snp.makeConstraints {
            $0.right.bottom.equalToSuperview().offset(0)
            $0.left.equalTo(tableView2.snp.left).offset(screenWidth/3)
            $0.top.equalTo(hederView.snp.bottom).offset(10)

        }
        hederView.addSubview(titlLab)
        titlLab.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview().offset(0)

        }

        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }
    

    func getData(code : String, type : Int) {
        
        // Do any additional setup after loading the view.
        let urlStr = "http://192.168.11.171:8080/dg-mall-news/headline/home-address/queryArea"
        var param = ["code":code];
        
        let body = try? JSONSerialization.data(withJSONObject: param  as Any, options: [])

        var requret = URLRequest.init(url: URL.init(string: urlStr)!)
        requret.httpBody = body
        requret.httpMethod = "POST"
        requret.timeoutInterval = 30
        requret.setValue("application/json", forHTTPHeaderField: "Accept")
        requret.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")

        Alamofire.request(requret).responseJSON { (response) in
            switch response.result{
            case .success(let json):
                let tResult = json as! NSDictionary

                if let jsonss = response.result.value {
                    let model = jsonModel()
                    let jsonDict = JSON(json)
                    model.resultCode = jsonDict["resultCode"].string ?? ""
               
                    let array: [[AnyHashable : Any]] = tResult["result"] as! [[AnyHashable : Any]]
                   

                    for i in 0..<array.count  {

                        let subDic = array[i]

                        let subModel = addressmodel.model(with: subDic)
                        
                        
                        
//                        subModel.fd_area_name = subDic["fd_area_name"].string ?? ""
//                        subModel.fd_area_code = subDic["fd_area_code"].int!
                    
                        self.daTaSubList.add(subModel)
                    }
                    

//                    let subModel:Content = self.daTaSubList[3] as! Content
                    
//                    print(subModel.fd_area_name)
                }
                do{
                    print(tResult)
                    let jsonData = try JSONSerialization.data(withJSONObject: tResult  as Any, options: [])
                    let jsonModels = try JSONDecoder().decode(jsonModel.self, from: jsonData)
                    print("-----------------")
                    print(jsonModels)
                    
//                    var submodel = jsonModels.result![2];
//
//                    print(submodel.fd_area_name)

                    print("-----------------")
                    
                }catch{
                    print(error)
                }
              

                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
            
                self.tableView.reloadData()

                break
                
            case .failure(let error):
                print("error:\(error)")
                
                break
            }
        }
    
    }




    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        tabBarController?.hidesBottomBarWhenPushed = false;
    }
    
    
}


extension SHSelectViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.daTaSubList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SHMineTabCell.self)
        let subModel:addressmodel = self.daTaSubList[indexPath.row] as! addressmodel
       
//        cell.subLab.text = daTaSubList[indexPath.row]
        cell.tipLabel.text = subModel.fd_area_name as String?;

        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let subModel:addressmodel = self.daTaSubList[indexPath.row] as! addressmodel
       
        let name = subModel.fd_area_name;
        
        self.titlLab.text = name as String?;
    }


}


    
