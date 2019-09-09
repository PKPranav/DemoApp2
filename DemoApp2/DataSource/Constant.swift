//
//  Constant.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 08/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import Foundation

struct FILENAME {
    static let videoFile = "SampleVideo_1280x720_20mb"
    static let docFile = "Sample-doc-file-100kb"
    static let pdfFile = "Sample_pdf__150kB"
    static let imageFile = "lal-bagh-botanical-garden-bangalore"
}

enum CellType: String {
    case image
    case video
    case doc
    case pdf
}
