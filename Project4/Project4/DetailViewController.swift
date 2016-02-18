//
//  DetailViewController.swift
//  Project4
//
//  Created by Brian Guo on 10/24/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit
protocol DetailViewControllerDelegate {
    func delete(controller: DetailViewController, index:Int)
}
class DetailViewController: UIViewController {

    var delegate:DetailViewControllerDelegate?
    
    @IBAction func DeletePerson(sender: UIBarButtonItem) {
        if let delegate = self.delegate{
            delegate.delete(self, index: self.index)
        }
    }
    var currentPerson:Person!
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var newAge: UITextField!
    @IBAction func changePerson(sender: UIButton) {
        if (!(newAge.text!.isEmpty ) && Int(newAge.text!) != nil){
            currentPerson.age = Int(newAge.text!)!
        }
        if (!(newName.text!.isEmpty)){
            currentPerson.name = newName.text!
            print(currentPerson.name + String(currentPerson.age))
        }
    }

    @IBOutlet weak var newName: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
