//
//  ViewController.swift
//  UITableViewTutorial2
//
//  Created by Zarko Popovski on 9/1/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let complexDataStructure = [
        ["section":"Section 1","elements":["Row 1", "Row 2", "Row 3", "Row 4"]],
        ["section":"Section 2","elements":["Row 5", "Row 6", "Row 7", "Row 8", "Row 9", "Row 10"]],
        ["section":"Section 3","elements":["Row 11", "Row 12"]],
        ["section":"Section 4","elements":["Row 13", "Row 14", "Row 15", "Row 16", "Row 17", "Row 18", "Row 19", "Row 20", "Row 21",
            "Row 22", "Row 23", "Row 24"]]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.complexDataStructure.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.complexDataStructure[section]["elements"])!.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionData = self.complexDataStructure[section]
        let sectionName = sectionData["section"] as! String
        return sectionName
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        
        let sectionData = self.complexDataStructure[indexPath.section]["elements"]
        
        cell.textLabel?.text = String(sectionData![indexPath.row])
        
        return cell
    }

}

