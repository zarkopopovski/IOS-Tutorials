//
//  ViewController.swift
//  UISegmentedControlTutorial
//
//  Created by Zarko Popovski on 8/6/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textFirst: UITextField!
    @IBOutlet weak var textSecond: UITextField!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func checkTextAction(sender: UIButton) {
        
        if segmentedControl.selectedSegmentIndex == 0
        {
            let textValueFirst = textFirst.text
            
            labelValue.text = "First value is: " + textValueFirst!
        }
        else
        {
            let textValueSecond = textSecond.text
            
            labelValue.text = "Second value is: " + textValueSecond!
        }
        
    }
    
    @IBAction func segmentChangeAction(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0
        {
            labelValue.text = "First segment is selected"
        }
        else
        {
            labelValue.text = "Second segment is selected"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

