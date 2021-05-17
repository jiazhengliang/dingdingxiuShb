//
//  WkwebViewController.swift
//  dingdingxiuSHB
//
//  Created by jones on 2021/5/12.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit
import WebKit




public protocol EatFoodDelegate: NSObjectProtocol {

    func eatMany(food1: String) -> Void
}

typealias textBlock = (String) -> ()

class WkwebViewController: SHBaseController, WKUIDelegate {

    weak var delegate: EatFoodDelegate?
    var block :textBlock?

    var progBar = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.load(NSURLRequest.init(url:URL.init(string: "https://www.baidu.com")!) as URLRequest)

        webView .addObserver(self, forKeyPath: "title", options: .new, context: nil)
        
        progBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        progBar.progress = 0.0;
        progBar.tintColor = UIColor.red;
        webView.addSubview(progBar)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)

        view.addSubview(barView)
        barView.backgroundColor = UIColor.white
        
        barView.setLeftButton(self.leftBtn)
    }
    
    lazy var webView : WKWebView  = {
        
        let tab = WKWebView(frame: CGRect(x: 0, y: navigationHeight, width: screenWidth, height: screenHeight - navigationHeight))

        tab.uiDelegate = self
        tab.navigationDelegate = self
        tab.allowsBackForwardNavigationGestures = false
        return tab
    }()
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "title")

    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webView.estimatedProgress), animated: true)
             //进度条的值最大为1.0
            if(self.webView.estimatedProgress >= 1.0) {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: { () -> Void in
                    self.progBar.alpha = 0.0
                }, completion: { (finished:Bool) -> Void in
                    self.progBar.progress = 0
                })
            }
        }else if keyPath == "title" {
            self.barView.setTitle(webView.title!)

        }
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
    
    override func LeftBtnClick(_: UIButton) {
        
        self.delegate!.eatMany(food1: "fanhui")
        self.navigationController?.popViewController(animated: true)
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
//extension SHMineViewController : UITableViewDelegate,UITableViewDataSource{
extension WkwebViewController:UIWebViewDelegate,WKNavigationDelegate
{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 实现非安全链接的跳转。如果目标主视图不为空,则允许导航
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            webView.load(navigationAction.request)
        }
        return nil
    }
}
