//
//  DogViewCell.swift
//  Dogs
//
//  Created by Bennett on 2018-08-18.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

public class DogViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    public func configure(with model: Photo) {
        dogImageView.image = model.image
        titleLabel.text = model.title
        let url = URL(string: model.url)
        print(model.url)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            if let image = UIImage(data: imageData) {
                dogImageView.image = image 
            }
        }
    }
}
