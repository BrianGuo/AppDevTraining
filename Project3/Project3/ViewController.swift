//
//  ViewController.swift
//  Project3
//
//  Created by Brian Guo on 10/17/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RedArena" {
            if let destinationViewController = segue.destinationViewController as? ShapeViewController {
                destinationViewController.color = UIColor.redColor()
                destinationViewController.israndom = false
            }
        }
        else if segue.identifier == "BlueArena" {
            if let destinationViewController = segue.destinationViewController as? ShapeViewController {
                destinationViewController.color = UIColor.blueColor()
                destinationViewController.israndom = false
            }
        }
        else if segue.identifier == "RandomArena" {
            if let destinationViewController = segue.destinationViewController as? ShapeViewController {
                destinationViewController.color = UIColor()
                destinationViewController.israndom = true
            }
        }
        else if segue.identifier == "TriangleArena" {
            if let destinationViewController = segue.destinationViewController as? ShapeViewController {
                destinationViewController.color = UIColor.greenColor()
                destinationViewController.israndom = false
            }
        }
    }
    
    @IBAction func ToRedArena(sender: UIButton) {
    }
    
    @IBAction func ToRandomArena(sender: UIButton) {
    }
    
    @IBAction func ToBlueArena(sender: UIButton) {
    }
    
    @IBAction func unwindToMainView(sender: UIStoryboardSegue){
        
    }
}

