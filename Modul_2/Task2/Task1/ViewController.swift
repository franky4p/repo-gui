//
//  ViewController.swift
//  Task2
//
//  Created by macbook on 24.10.2020.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var wkWebView: WKWebView! {
        didSet{
            wkWebView.navigationDelegate = self
        }
    }
    
    func connect() {
        let request = RequestVK.requestConnectVK()
        self.wkWebView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func transitionToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vController = storyboard.instantiateViewController(identifier: "homeController")
        
        UIApplication.shared.windows.first?.rootViewController = vController
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        let token = params["access_token"]
        decisionHandler(.cancel)
        if token != nil {
            Session.shared.token = token
            Session.shared.updateFromServer()
            
            transitionToMain()
        }
    }
}

