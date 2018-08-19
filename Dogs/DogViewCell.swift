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
    
    public func configure(with model: Dog) {
        dogImageView.image = model.image
        titleLabel.text = model.title
    }
}
