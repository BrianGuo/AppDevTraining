//
//  ViewController.swift
//  Project6
//
//  Created by Brian Guo on 11/7/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var Score: UILabel!
    var particles:[UIView]!
    var timer:NSTimer!
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    @IBOutlet weak var Spaceship: UIImageView!
    
    @IBOutlet weak var Difficulty: UISegmentedControl!
    @IBOutlet weak var Startbutton: UIButton!
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        Score.center.x = view.frame.minX + 40
        Score.center.y = view.frame.minY + 30
        Score.textColor = UIColor.whiteColor()
        Score.text = "0"
        Startbutton.center.x = view.center.x
        Startbutton.center.y = view.center.y
        Difficulty.center.x = view.center.x
        Difficulty.center.y = Startbutton.center.y + 40
        
        Spaceship.frame = CGRect(x: view.frame.width/2, y: view.frame.height - 100, width: 40, height: 50)
        particles = []
        animator = UIDynamicAnimator(referenceView: view)
        view.backgroundColor = UIColor.blackColor()
        gravity = UIGravityBehavior(items: [])
        gravity.magnitude = 0.5
        animator.addBehavior(gravity)
        
        
        
    }
    @IBAction func Start(sender: UIButton) {
        sender.removeFromSuperview()
        Difficulty.removeFromSuperview()
        var level:Double
        if Difficulty.selectedSegmentIndex == 0 {
            level = 1.0
        }
        else if Difficulty.selectedSegmentIndex == 1 {
            level = 0.5
        }
        else {
            level = 0.1
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(level, target: self, selector: "timerfired:", userInfo: nil, repeats: true)
        let timer2 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "timer2fired:", userInfo:  nil, repeats: true)
    }
    
    func timer2fired(sender: NSTimer) {
        if (Spaceship != nil){
            for particle in particles {
                if (CGRectIntersectsRect(Spaceship.frame, particle.frame)){
                    Spaceship.removeFromSuperview()
                    particle.removeFromSuperview()
                    timer.invalidate()
                }
            }
        }
    }
    @IBAction func DragShip(sender: UIPanGestureRecognizer) {
        let shipView = sender.view!
        let trans = sender.translationInView(self.view)
        shipView.center = CGPoint(x: shipView.center.x + trans.x, y: shipView.center.y + trans.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    func timerfired(sender: NSTimer) {
        let randcoord = CGFloat(drand48() * Double(view.frame.width))
        let v = UIView(frame: CGRect(x: randcoord, y: 6, width: 10, height: 10))
        v.topAnchor.constraintEqualToAnchor(view.topAnchor)
        v.backgroundColor = UIColor.whiteColor()
        view.addSubview(v)
        particles.append(v)
        let collision = UICollisionBehavior(items:[v])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        gravity.addItem(v)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        let item2 = item as! UIView
        item2.removeFromSuperview()
        Score.text = String(Int(Score.text!)! + 1)
    }


}

