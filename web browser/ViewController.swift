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
        
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open page", style: .plain, target: self, action: #selector(openTapped))
        
        //automatically take up as much space as it can from the left
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webview, action: #selector(webview.reload))
        
        toolbarItems = [spacer, refresh]
        navigationController?.isToolbarHidden = false
    }
    
    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: "", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else {return}
        guard let url = URL(string: "https://" + actionTitle) else {return}
        webview.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webview.title
    }
    
}

