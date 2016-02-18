//
//  TableViewController.swift
//  Project4
//
//  Created by Brian Guo on 10/24/15.
//  Copyright © 2015 Brian Guo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,AddViewControllerDelegate,DetailViewControllerDelegate {
    
    var Images:[UIImage]! = [UIImage(named: "Image1.jpg")!]
    var friends:[Person]! = [Person(name: "Stacy", age: 5, image: UIImage(named: "Image1.jpg")!), Person(name: "Brendan", age: 18, image:UIImage(named: "Image1.jpg")!), Person(name: "Andrew", age: 18,image:UIImage(named: "Image1.jpg")!),Person(name: "Sophia", age: 18,image:UIImage(named: "Image1.jpg")!),Person(name: "Ben", age: 18,image:UIImage(named: "Image1.jpg")!),Person(name: "Justin", age: 18,image:UIImage(named: "Image1.jpg")!)]
    
    func delete(controller: DetailViewController, index:Int) {
        friends.removeAtIndex(index)
    }
    
    func controller(controller: AddViewController, newFriends: [Person]) {
        friends = newFriends
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        print(friends)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        let name = friends[indexPath.row].name
        let age = friends[indexPath.row].age
        let image = friends[indexPath.row].image
        cell.PersonDescription.text = "\(name) is \(age) years old"
        cell.ImageView.image = image
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row%2 == 1){
            return 60
        }
        else{
            return 40
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DetailSegue"){
            let destination = segue.destinationViewController as! DetailViewController
            let index = self.tableView.indexPathForCell(sender as!UITableViewCell)?.row
            destination.currentPerson = friends[index!]
            destination.index = index!
            destination.delegate = self
        }
        if(segue.identifier == "AddSegue"){
            let destination = segue.destinationViewController as! AddViewController
            destination.friends = friends
            destination.delegate = self
        }
    }
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

}
