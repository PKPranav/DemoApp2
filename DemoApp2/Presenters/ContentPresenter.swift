//
//  ContentPresenter.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 06/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit

protocol ContentViewDelegate:NSObjectProtocol {
    func displayData(contentModels:[ContentModel]?)
}
class ContentPresenter {
    private let contentService:ContentService
    weak private var contentViewDelegate:ContentViewDelegate?
    
    init(contentService:ContentService) {
        self.contentService = contentService
    }
    
    func setViewDelegate(contentViewDelegate:ContentViewDelegate?) {
        self.contentViewDelegate = contentViewDelegate
    }
    
    func getContentList() {
        contentService.getContentModel { [weak self] contentModels in
            if let contentModels = contentModels {
                self?.contentViewDelegate?.displayData(contentModels: contentModels)
            }
        }
    }
}
