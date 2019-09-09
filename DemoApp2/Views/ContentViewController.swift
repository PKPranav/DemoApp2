//
//  ContentViewController.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 07/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit
import PDFKit
import AVFoundation

class ContentViewController: UIViewController {
    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    private let presenter = ContentPresenter(contentService: ContentService())
    var contentToDisplay = [ContentModel]()
    
    // MARK: - Constants

    let imageCellId = "ImageCollectionViewCell"
    let pdfCellId = "PDFCollectionViewCell"
    let docCellId = "DocCollectionViewCell"
    let videoCellId = "VideoCollectionViewCell"
    
    let itemHeight = CGFloat(400.0)

    
    // MARK: - Constants
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Demo"
        setUp()
        presenter.setViewDelegate(contentViewDelegate: self)
        presenter.getContentList()
    }
    
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let flowLayout = self.contentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.contentCollectionView.bounds.width, height: itemHeight)
        }
    }
    
    // MARK: - Setup
    
    func setUp() {
        if let flowLayout = self.contentCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


// MARK: - UICollectionViewDataSource
extension ContentViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let contentModel = contentToDisplay[indexPath.row]
        switch contentModel.type {
        
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as! ImageCollectionViewCell
            cell.configureCell(withData: contentModel)
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoCellId, for: indexPath) as! VideoCollectionViewCell
            cell.configureCell(withData: contentModel)
            return cell
        case .doc:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: docCellId, for: indexPath) as! DocCollectionViewCell
            cell.configureCell(withData: contentModel)
            return cell
        case .pdf:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pdfCellId, for: indexPath) as! PDFCollectionViewCell
            cell.configureCell(withData: contentModel)
            return cell
        }
    }
}


// MARK: - UICollectionViewDelegate
extension ContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}


// MARK: - ContentViewDelegate
extension ContentViewController: ContentViewDelegate {
    func displayData(contentModels: [ContentModel]?) {
        contentToDisplay = contentModels ?? []
        contentCollectionView.reloadData()
    }
}

