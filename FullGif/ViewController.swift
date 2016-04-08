//
//  ViewController.swift
//  FullGif
//
//  Created by  on 3/7/16.
//  Copyright © 2016 Tuan_Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array: [AnyObject]!
    var currentURL: String = "http://bideox.com/post"
    
    func getData() {
        do {
            let url: NSURL = NSURL(string: currentURL)!
            let data: NSData = NSData(contentsOfURL: url)!
            
            let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let nextPage = jsonData["next"] as? String {
                currentURL = nextPage
            }
            
            if let results = jsonData["results"] as? [[String: AnyObject]] {
                // if we get "blogs" from the JSON
                // AND we can cast it to an array of dictionaries
                // then this code will execute
                array = results
            }
            print("Get data success")
        } catch {
            print("Get data error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        self.performSegueWithIdentifier("showListGIF", sender: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showListGIF" {
            let controller = segue.destinationViewController as! DataTableViewController
            controller.currentURL = self.currentURL
            controller.array = self.array
        }
    }
}

