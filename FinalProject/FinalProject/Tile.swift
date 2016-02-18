//
//  Tile.swift
//  FinalProject
//
//  Created by Brian Guo on 12/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class Tile: UIButton {

    var flipped:Bool = false;
    var bomb:Bool = false;
    var flagged:Bool = false;
    var justRemovedFlag:Bool = false;
    
    func setBomb(){
        bomb = true;
    }
    
    func getBomb() -> Bool {
        return bomb;
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
