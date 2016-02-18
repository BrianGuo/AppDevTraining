//
//  ShapeViewController.swift
//  Project3
//
//  Created by Brian Guo on 10/18/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    var hidden:Bool
    var color:UIColor
    var views:[UIView]
    var israndom:Bool
    
    required init?(coder aDecoder: NSCoder) {
        self.color = UIColor.greenColor()
        self.views = []
        self.israndom = false
        self.hidden = false
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var ShapeSize: UISlider!
    
    @IBOutlet weak var RevealButton: UIButton!
    @IBAction func ShowHide(sender: UIButton) {
        hidden = !hidden
        if hidden {
            for thisview in views {
                thisview.alpha = 0.0
            }
        }
        else {
            for thisview in views {
                thisview.alpha = 1.0
            }
        }
    }
    
    @IBAction func Erase(sender: UIButton) {
        if views.count != 0 {
            let lastView = views[views.count - 1]
            lastView.removeFromSuperview()
            views.removeLast()
        }
    }
    
    @IBOutlet weak var Eraser: UIButton!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first!.locationInView(view)
        let newView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(ShapeSize.value), height: CGFloat(ShapeSize.value)))
        newView.center = location
        if israndom{
            let red:CGFloat = CGFloat(drand48())
            let blue:CGFloat = CGFloat(drand48())
            let green:CGFloat = CGFloat(drand48())
            let Randomcolor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            newView.backgroundColor = Randomcolor
        }
        else {
            newView.backgroundColor = color
        }
        views.append(newView)
        view.addSubview(newView)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
