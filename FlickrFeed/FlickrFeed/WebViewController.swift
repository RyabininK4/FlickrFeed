//
//  WebViewController.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 16.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(URLRequest(url: URL(string: url!)!))
    }
}
