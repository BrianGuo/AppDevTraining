//
//  TableViewCell.swift
//  Project4
//
//  Created by Brian Guo on 10/24/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var PersonDescription: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
}
