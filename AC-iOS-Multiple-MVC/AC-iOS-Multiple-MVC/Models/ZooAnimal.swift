//
//  ZooAnimal.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation

class ZooAnimal {
    let name: String
    let imageNumber: Int
    let origin: String
    let classification: String
    let info: String
    
    init(name: String, imageNumber: Int, origin: String, classification: String, info: String) {
        self.name = name
        self.imageNumber = imageNumber
        self.origin = origin
        self.classification = classification
        self.info = info
    }

}


