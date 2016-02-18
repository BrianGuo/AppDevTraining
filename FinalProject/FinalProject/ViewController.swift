//
//  ViewController.swift
//  FinalProject
//
//  Created by Brian Guo on 12/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HelpLabel: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var scoreNumber: UILabel!
    let bombImage = UIImage(named: "bomb.png")
    let backgroundColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1)
    var flagTimer:NSTimer!
    var worldTimer:NSTimer!
    var startTime = NSDate()
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var difficulty: UISegmentedControl!
    var grid:[Tile] = []
    var sideLength = 0
    var bombs = 0
    var colors:[UIColor] = [UIColor(red: 0, green: 150/255.0, blue: 255/255.0, alpha: 1), UIColor(red: 0, green: 1, blue: 200/255.0, alpha: 1), UIColor(red: 255/255.0, green: 65/255.0, blue: 128/255.0, alpha: 1), UIColor(red: 182/255.0, green: 131/255.0, blue: 81/255.0, alpha: 1), UIColor.magentaColor(), UIColor.blackColor(), UIColor.purpleColor(), UIColor.whiteColor() ]
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreNumber.text = "0"
        switch difficulty.selectedSegmentIndex{
        case 0:
            sideLength = 8
            bombs = 10
            break
        case 1:
            sideLength = 10
            bombs = 15
            break
        case 2:
            sideLength = 12
            bombs = 20
            break
        default:
            sideLength = 8
            bombs = 10
            break
        }
        draw()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func switchDifficulty(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            sideLength = 8
            bombs = 10
            break
        case 1:
            sideLength = 10
            bombs = 15
            break
        case 2:
            sideLength = 12
            bombs = 20
            break
        default:
            sideLength = 8
            bombs = 10
            break
        }
        draw()
    }
    
    func updateTime(sender: NSTimer) {
        let timeInterval:Double = round(NSDate().timeIntervalSinceDate(startTime)*100)/100
        time.text = "\(timeInterval)"
    }
    @IBAction func refresh(sender: UIButton) {
        draw()
    }
    func draw() {
        for tile in grid {
            tile.removeFromSuperview()
        }
        grid.removeAll()
        scoreNumber.text = "0"
        HelpLabel.text = "Place Flags by clicking and holding"
        startTime = NSDate()
        for var index = 0; index < sideLength*sideLength; ++index {
            let offset = view.frame.maxX/CGFloat(sideLength)
            let tile = Tile(frame: CGRect(x: (index%sideLength)*Int(offset), y: (index/sideLength)*Int(offset) + 40, width: Int(offset), height: Int(offset)))
            let image = UIImage(named: "tile.jpg")! as UIImage
            tile.setImage(image, forState: .Normal)
            tile.layer.borderColor = UIColor.grayColor().CGColor
            tile.layer.borderWidth = 3
            tile.addTarget(self, action: "tileSelected:", forControlEvents: UIControlEvents.TouchDown)
            tile.addTarget(self, action: "cancelTimer:", forControlEvents: UIControlEvents.TouchUpInside)
            tile.addTarget(self, action: "cancelTimer:", forControlEvents: UIControlEvents.TouchDragExit)
            grid.append(tile)
            view.addSubview(tile)
        }
        var bombCount = 0;
        while bombCount < bombs {
            let index = arc4random_uniform(UInt32(sideLength*sideLength))
            let bomb = grid[Int(index)]
            if bomb.getBomb() == false {
                bomb.setBomb()
                bombCount++
            }
        }
        worldTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateTime:", userInfo: nil, repeats: true)
    }
    func addFlag(sender: NSTimer) {
        let tile = sender.userInfo as! Tile
        tile.setImage(UIImage(named: "flagTile.jpg"), forState: .Normal)
        tile.flagged = true
        tile.selected = false
    }
    
    func cancelTimer(sender: UIButton) {
        let sender2 = sender as! Tile
        if flagTimer != nil && !sender2.flagged && !sender2.justRemovedFlag && !sender2.flipped  {
            flagTimer.invalidate()
            tileActivated(sender2)
        }
        else if sender2.justRemovedFlag == true{
            sender2.justRemovedFlag = false
        }
    }
    
    func tileSelected(sender:UIButton!) {
        let sender2 = sender as! Tile
        if sender2.flagged == false && sender2.flipped == false {
            flagTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "addFlag:", userInfo: sender, repeats: false)
        }
        else if sender2.flagged == true{
            sender2.flagged = false
            sender2.justRemovedFlag = true;
            sender2.setImage(UIImage(named: "tile.jpg"), forState: .Normal)
        }
    }
    func tileActivated(sender: UIButton!) {
        let sender2 = sender as! Tile
        sender2.flipped = true
        if sender2.getBomb(){
            worldTimer.invalidate()
            sender2.setImage(bombImage, forState: .Normal)
            sender2.backgroundColor = UIColor.redColor()
            sender2.enabled = false
            HelpLabel.text = "Game Over!"
            for tile in self.grid {
                if tile.getBomb() && tile != sender2 {
                    tile.setImage(self.bombImage, forState: .Normal)
                    tile.backgroundColor = self.backgroundColor
                }
                tile.userInteractionEnabled = false
            }
        }
        else {
            print(scoreNumber.text)
            var scoreNum:Int = Int(scoreNumber.text!)!
            scoreNum = scoreNum + 20
            scoreNumber.text = "\(scoreNum)"
            if scoreNum == ((sideLength * sideLength - bombs) * 20){
                worldTimer.invalidate()
                HelpLabel.text = "You've won!"
                for tile in self.grid {
                    tile.userInteractionEnabled = false
                }
            }
            sender2.backgroundColor = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1)
            let nearby = count(sender2)
            if nearby != 0 {
                sender2.setImage(nil, forState: .Normal)
                sender2.setTitleColor(colors[nearby - 1], forState: .Normal)
                sender2.setTitle(String(nearby), forState: .Normal)
            }
            else{
                let column = grid.indexOf(sender2)!%sideLength
                let row = grid.indexOf(sender2)!/sideLength
                for var index = -1; index < 2; index++ {
                    if (column + index > sideLength - 1 || column + index < 0){
                        continue
                    }
                    if row-1 >= 0{
                        let selected = grid[(row-1) * sideLength + column + index]
                        if ( selected.flipped == false){
                            tileActivated(selected)
                        }
                    }
                    if row + 1 < sideLength {
                        let selected = grid[(row+1) * sideLength + column + index]
                        if ( selected.flipped == false){
                            tileActivated(selected)
                        }
                    }
                }
                if (column + 1 < sideLength){
                    let selected = grid[row * sideLength + column + 1]
                    if ( selected.flipped == false){
                        tileActivated(selected)
                    }
                }
                if (column - 1 >= 0) {
                    let selected = grid[row * sideLength + column - 1]
                    if ( selected.flipped == false){
                        tileActivated(selected)
                    }
                }
                sender2.setImage(nil, forState: .Normal)
            }
        }
    }
    
    func count(tile:Tile) -> Int {
        var count = 0
        let column = grid.indexOf(tile)!%sideLength
        let row = grid.indexOf(tile)!/sideLength
        for var index = -1; index < 2; index++ {
            if (column + index > sideLength-1 || column + index < 0){
                continue
            }
            if row-1 >= 0{
                if (grid[(row-1) * sideLength + column + index].getBomb()){
                    count++
                }
            }
            if row + 1 < sideLength {
                if (grid[(row+1) * sideLength + column + index].getBomb()){
                    count++
                }
            }
        }
        if (column + 1 < sideLength){
            if (grid[row * sideLength + column + 1].getBomb()){
                count++
            }
        }
        if (column - 1 >= 0) {
            if (grid[row * sideLength + column - 1].getBomb()){
                count++
            }
        }
        /*sender2.setImage(nil, forState: .Normal)
        if count == 0 {
            sender2.setTitle("", forState: .Normal)
        }
        else{
            sender2.setTitle(String(count), forState: .Normal)
        }*/
        return count

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

