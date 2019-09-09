//
//  PDFCollectionViewCell.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 08/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit
import PDFKit

class PDFCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var pdfView: PDFView!

    func configureCell(withData data:ContentModel) {
        titleLbl.text = data.name
        if let url = Bundle.main.url(forResource: data.fileName, withExtension: "pdf") {
            pdfView.autoScales = true
            let document = PDFDocument(url: url)
            pdfView.document = document
            layoutIfNeeded()
        }
    }
}
