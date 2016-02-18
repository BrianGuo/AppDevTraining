//
//  TableViewController.swift
//  Project5.1
//
//  Created by Brian Guo on 11/1/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit
let JSON_URL = "https://raw.githubusercontent.com/BrianGuo/AppDevJson/master/Info.json?token=AFK-0yrDfeRjFVVcK2EVR-XFyRQ76zW0ks5WXNafwA%3D%3D"
class TableViewController: UITableViewController {
        
        var people:[Person] = []
        

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            dispatch_async(dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_HIGH), 0)){
                self.getData()
                dispatch_async(dispatch_get_main_queue()){
                    self.tableView.reloadData()
                }
            }
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: "refresh:", forControlEvents:UIControlEvents.ValueChanged)
            self.tableView.addSubview(refreshControl)
            
        }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        for peep in people{
            print(peep.fullName)
        }
        tableView.reloadData()
        
    }
        func refresh(sender: UIRefreshControl) {
            self.tableView.reloadData()
            sender.endRefreshing()
        }
        func getData() {
            let url = NSURL(string: JSON_URL)!
            guard let jsonData = NSData(contentsOfURL: url) else {
                return
            }
            guard let jsonArray = (try? NSJSONSerialization.JSONObjectWithData(jsonData, options: [])) as? [AnyObject] else {return}
            for obj in jsonArray {
                let first = obj["fname"] as? String ?? ""
                let last = obj["lname"] as? String ?? ""
                let phone = obj["phone"] as? String ?? ""
                var emails: [String] = []
                if let oneEmail = obj["email"] as? String {
                    emails.append(oneEmail)
                }
                else {
                    emails = obj["email"] as? [String] ?? []
                }
                let picture = obj["picture"] as? String ?? ""
                let pictureURL = NSURL(string: picture)
                let image = UIImage(data: NSData(contentsOfURL: pictureURL!)!)
                let person = Person(first: first, last: last, phone: phone, email: emails, picture: image!)
                people.append(person);
            }
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return people.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =  tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
            cell.setPerson(people[indexPath.row])
            return cell
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "DetailSegue" {
                let destination = segue.destinationViewController as! DetailViewController
                let cell = sender as! TableViewCell
                let index = tableView.indexPathForCell(cell)
                destination.current = people[(index?.row)!]
            }
        }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            people.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
}

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

