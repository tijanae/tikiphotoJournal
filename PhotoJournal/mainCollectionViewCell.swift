//
//  mainCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Tia Lendor on 10/6/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class mainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var JournalName: UILabel!
    
    @IBOutlet weak var DateJournalAdded: UILabel!
    
    func configureCell(photo: PhotoJournalInfo) {
       
        JournalName.text = photo.caption
        let path = getDocumentsDirectory().appendingPathComponent(photo.imageName)
        mainImage.image = UIImage(contentsOfFile: path.path)
    }
    
    
}
