//
//  TableViewCell.swift
//  Project5.1
//
//  Created by Brian Guo on 11/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var PhoneNumber: UILabel!
    @IBOutlet weak var Email: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setPerson(person: Person) {
        Name.text = person.fullName
        PhoneNumber.text = person.phone
        Email.text = person.email.joinWithSeparator(", ")
        Picture.image = person.picture
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}