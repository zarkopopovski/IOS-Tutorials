//
//  ViewController.swift
//  UITableViewTutorial
//
//  Created by Zarko Popovski on 8/19/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataArray = ["Row 1", "Row 2", "Row 3", "Row 4", "Row 5", "Row 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
        
        let dataFromArray = dataArray[indexPath.row]
        
        cell!.textLabel?.text = dataFromArray
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dataFromArray = dataArray[indexPath.row]
        
        let alertController = UIAlertController(title: "Selected Cell", message: "Text from selected cell: " + dataFromArray, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (myAction) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertController.addAction(okAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

