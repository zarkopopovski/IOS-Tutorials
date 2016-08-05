//
//  ViewController.swift
//  UISwitchControlTutorial
//
//  Created by Zarko Popovski on 8/5/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var buttonChangeState: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if switchControl.on
        {
            stateLabel.text = "UISwitch State On"
        }
        else
        {
            stateLabel.text = "UISwitch State Off"
        }
        
    }

    @IBAction func changeStateAction(sender: UISwitch) {
        if sender.on
        {
            stateLabel.text = "UISwitch State On"
        }
        else
        {
            stateLabel.text = "UISwitch State Off"
        }
    }
    
    @IBAction func manuallyChangeStateAction(sender: AnyObject) {
        if switchControl.on
        {
            switchControl.setOn(false, animated: true)
            stateLabel.text = "UISwitch State Off"
        }
        else
        {
            switchControl.setOn(true, animated: true)
            stateLabel.text = "UISwitch State On"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

