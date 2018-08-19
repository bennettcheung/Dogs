//
//  Dog.swift
//  Dogs
//
//  Created by Bennett on 2018-08-18.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

public class Photo: NSObject {

    var title:String
    var id:String
    var image:UIImage?
    var url:String
    
    
    init(title: String, id: String, url: String) {
        self.title = title
        self.id = id
        self.url = url
    }
}
