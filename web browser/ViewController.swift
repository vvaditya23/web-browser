//
//  ViewController.swift
//  web browser
//
//  Created by ヴィヤヴャハレ・アディティヤ on 19/11/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webview = WKWebView()
    
    override func loadView() {
        webview.navigationDelegate = self
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.co.in")!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
    }


}

