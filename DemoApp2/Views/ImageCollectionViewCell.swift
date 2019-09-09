//
//  ImageCollectionViewCell.swift
//  DemoApp2
//
//  Created by Pramod Kumar Pranav on 08/09/19.
//  Copyright © 2019 Pramod Kumar Pranav. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var imageView:UIImageView!
    
    func configureCell(withData data:ContentModel) {
        titleLbl.text = data.name
        imageView.image = UIImage(named: data.fileName)
    }
}
