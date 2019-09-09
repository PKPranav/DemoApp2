//
//  VideoCollectionViewCell.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 08/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit
import AVFoundation
import WebKit


class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var webView:WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureCell(withData data:ContentModel) {
        titleLbl.text = data.name
        if let url = Bundle.main.url(forResource: data.fileName, withExtension: "mp4") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}
