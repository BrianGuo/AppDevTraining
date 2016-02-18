//
//  Person.swift
//  Project5.1
//
//  Created by Brian Guo on 11/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class Person: NSObject {

    var first: String!
    var last: String!
    var phone: String!
    var email: [String]!
    var picture: UIImage!
    
    var fullName:String {
        return "\(first) \(last)"
    }
    init(first: String, last: String, phone: String, email: [String], picture: UIImage) {
        self.first = first
        self.last = last
        self.phone = phone
        self.email = email
        self.picture  = picture
    }
}
