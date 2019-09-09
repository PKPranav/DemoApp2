//
//  ContentService.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 06/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit

class ContentService {
    func getContentModel(_ callBack:([ContentModel]?) -> Void) {
        //Using static  data to display
        let contentModels = [ContentModel(name: "Image", fileName:FILENAME.imageFile,type: CellType.image),
                             ContentModel(name: "Doc", fileName:FILENAME.docFile,type:CellType.doc),
                             ContentModel(name: "Video", fileName:FILENAME.videoFile,type:CellType.video),
                             ContentModel(name: "PDF", fileName:FILENAME.pdfFile,type: CellType.pdf),
                             ContentModel(name: "Doc", fileName:FILENAME.docFile,type:CellType.doc)
        ]
        
        callBack(contentModels)
        
    }
}
