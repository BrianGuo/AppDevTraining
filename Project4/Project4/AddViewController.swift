//
//  AddViewController.swift
//  Project4
//
//  Created by Brian Guo on 10/24/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit
protocol AddViewControllerDelegate{
    func controller(controller: AddViewController, newFriends:[Person])
}
class AddViewController: UIViewController {
    
    var delegate: AddViewControllerDelegate?
    var friends:[Person]!
    @IBOutlet weak var newName: UITextField!

    @IBOutlet weak var newAge: UITextField!
    
    @IBAction func addPerson(sender: UIButton) {
        if (!(newAge.text!.isEmpty ) && Int(newAge.text!) != nil && !(newName.text!.isEmpty)){
            let p = Person(name: newName.text!, age: Int(newAge.text!)!)
            friends.append(p)
            print(friends)
            if let delegate = self.delegate {
                delegate.controller(self, newFriends: friends)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let destination = subsequentVC as! TableViewController
        destination.friends = friends
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
