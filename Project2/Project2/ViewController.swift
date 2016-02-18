//
//  ViewController.swift
//  Project2
//
//  Created by Brian Guo on 10/3/15.
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

    @IBOutlet weak var GPA: UITextField!
    @IBOutlet weak var Major: UITextField!
    @IBOutlet weak var Year: UITextField!
    @IBOutlet weak var Sortby: UISegmentedControl!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var TextDisplay: UITextView!
    
    @IBOutlet weak var Date: UIDatePicker!
    
    var students: [Student] = []
    class Student: NSObject {
        var name: String
        var year: Int
        var major: String
        var gpa: Double
        var date: NSDate
        
        init(name: String, year: Int, major: String, gpa: Double, date: NSDate) {
            self.name = name
            self.year = year
            self.major = major
            self.gpa = gpa
            self.date = date
        }
        
        override var description: String {
            return "\(name) is majoring in \(major) with a \(gpa)"
        }
    }
    @IBAction func AddStudent(sender: UIButton) {
        let year = Int(Year.text!)
        if  year == nil {
            return
        }
        let gpa = Double(GPA.text!)
        if (gpa == nil || gpa < 0 || gpa > 4.5) {
            return
        }
        let student = Student(name: Name.text!, year: year!, major: Major.text!, gpa: gpa!, date: Date.date)
        students.append(student)
        switch Sortby.selectedSegmentIndex {
        case 0:
            students.sortInPlace({$0.name < $1.name})
        case 1:
            students.sortInPlace({$0.year < $1.year})
        case 2:
            students.sortInPlace({$0.major < $1.major})
        case 3:
            students.sortInPlace({$0.gpa < $1.gpa})
        default:
            break
        }
        TextDisplay.text = ""
        for s in students {
            TextDisplay.text = TextDisplay.text + s.description + "\n"
        }
        
        Name.text = ""
        GPA.text = ""
        Major.text = ""
        Year.text = ""
    }
    @IBAction func switchSorts(sender: AnyObject) {
        switch Sortby.selectedSegmentIndex {
        case 0:
            students.sortInPlace({$0.name < $1.name})
        case 1:
            students.sortInPlace({$0.year < $1.year})
        case 2:
            students.sortInPlace({$0.major < $1.major})
        case 3:
            students.sortInPlace({$0.gpa < $1.gpa})
        default:
            break
        }
        TextDisplay.text = ""
        for s in students {
            TextDisplay.text = TextDisplay.text + s.description + "\n"
        }
    }

}

