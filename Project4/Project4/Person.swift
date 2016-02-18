//
//  Person.swift
//  Project4
//
//  Created by Brian Guo on 10/24/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String
    var age:Int
    var image:UIImage
    
    init(name: String, age:Int, image:UIImage){
        self.name = name
        self.age = age
        self.image = image
    }
    
    func setThisImage(thisImage: UIImage) {
        self.image = thisImage
    }
    init(name: String, age:Int){
        self.name = name
        self.age = age
        self.image = UIImage()
    }
}
