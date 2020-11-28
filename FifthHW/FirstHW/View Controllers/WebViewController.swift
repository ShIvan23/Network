//
//  WebViewController.swift
//  FirstHW
//
//  Created by Ivan on 12.11.2020.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    //    MARK: - Puplic Properties
    var URLString: String?
    
    //    MARK: - Private Properties
    private var webView: WKWebView!
    
    //    MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createWebView()
    }
    
    //    MARK: - Override Methods
    override func loadView() {
        view = webView
    }
    
    //    MARK: - Private Methods
    private func createWebView() {
        let source = "document.body.style.background = \"#FFE7B0\";"
        let userScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        let webVC = WKUserContentController()
        webVC.addUserScript(userScript)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.userContentController = webVC
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        let myURL = URL(string: URLString ?? "")
        webView.load(URLRequest(url: myURL!))
        webView.allowsBackForwardNavigationGestures = true
        webView.reload()
    }
}
