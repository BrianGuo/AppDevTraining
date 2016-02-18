//
//  ViewController.swift
//  Project1
//
//  Created by Brian Guo on 9/27/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SecretMessage.text = "Secret Message Goes Here"
        MessageButton.setTitle("Reveal Message", forState: .Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var SecretMessage: UILabel!

    @IBOutlet weak var MessageButton: UIButton!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func RevealMessage(sender: UIButton) {
        if(UsernameField.text == "username" && PasswordField.text == "password"){
            SecretMessage.text = "Here's the Message"
            SecretMessage.textColor = UIColor.purpleColor()
            SecretMessage.shadowColor = UIColor.redColor()
        }
        else{
            SecretMessage.text = "Incorrect Username or Password"
            SecretMessage.textColor = UIColor.redColor()
            SecretMessage.font = UIFont(name: "Courier", size: 12)
        }
    }
}

