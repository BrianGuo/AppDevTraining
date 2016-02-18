//
//  TriangleViewController.swift
//  Project3
//
//  Created by Brian Guo on 10/18/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class TriangleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first!.locationInView(view)
        let triangle = TriangeView(frame: CGRectMake(10, 20, 25, 30))
        triangle.backgroundColor = UIColor.whiteColor()
        triangle.center = location
        view.addSubview(triangle)
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
