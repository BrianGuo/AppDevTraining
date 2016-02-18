//
//  DetailViewController.swift
//  Project5.1
//
//  Created by Brian Guo on 11/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var current:Person!
    
    @IBAction func Update(sender: UIButton) {
        let name = Name.text
        if ((name?.isEmpty) == false){
            var nameArray = name!.characters.split{$0 == " "}.map(String.init)
            var firstName = ""
            for var i = 0; i < nameArray.count-1; i++ {
                firstName = firstName + nameArray[i]
            }
            var lastName = nameArray[nameArray.count - 1]
            current.first = firstName
            current.last = lastName
        }
        current.phone = PhoneNumber.text
        current.email = Emails.text.characters.split{$0 == "\n"}.map(String.init)
        print(current.fullName)
    }
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Emails: UITextView!
    @IBOutlet weak var PhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text =  current.fullName
        PhoneNumber.text = current.phone
        Emails.text = ""
        for i in current.email{
            Emails.text = Emails.text + i + "\n"
        }
        // Do any additional setup after loading the view.
    }
    
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
