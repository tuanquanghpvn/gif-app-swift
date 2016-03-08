//
//  DataTableViewController.swift
//  FullGif
//
//  Created by  on 3/7/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {
    
    var array: [AnyObject]!
    
    func getData() {
        do {
            let url: NSURL = NSURL(string: "http://bideox.com/post")!
            let data: NSData = NSData(contentsOfURL: url)!
            
            let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let results = jsonData["results"] as? [[String: AnyObject]] {
                // if we get "blogs" from the JSON
                // AND we can cast it to an array of dictionaries
                // then this code will execute
                array = results
            }
        } catch {
            print("Get data error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }
    
    func actShare(sender: UIButton) {
        print(String(sender.tag))
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell

        // Configure the cell...
        
        // Show data on table view cell
        let obj: AnyObject = array[indexPath.row]
        
        if let name = obj["name"] as? String {
            cell.lblName.text = name
        } else {
            cell.lblName.text = ""
        }
        
        let imgUrl: NSURL = NSURL(string: obj["image"] as! String)!
        let imgData: NSData = NSData(contentsOfURL: imgUrl)!
        cell.imgGif.image = UIImage(data: imgData)!
        
        // Register event
        cell.btnShare.tag = indexPath.row
//        cell.btnShare.addTarget(self, action: "actShare:", forControlEvents: .TouchUpInside)
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 350
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

extension DataTableViewController: TableViewCellDelegate {
    func tableViewCellDidShare(sender: TableViewCell) {
        print("SHARE")
    }
}