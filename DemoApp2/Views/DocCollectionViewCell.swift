//
//  DocCollectionViewCell.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 08/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit
import WebKit

class DocCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var webView:WKWebView!
    
    func configureCell(withData data:ContentModel) {
        titleLbl.text = data.name
        if let url = Bundle.main.url(forResource: data.fileName, withExtension: "doc") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}
