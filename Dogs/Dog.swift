//
//  Dog.swift
//  Dogs
//
//  Created by Bennett on 2018-08-18.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

public class Dog: NSObject {

    var title:String
    var image:UIImage?
    var url:String
    
    
    init(title: String, image: String, url: String) {
        self.title = title
        self.image = UIImage.init(named: image)
        self.url = url
    }
}
