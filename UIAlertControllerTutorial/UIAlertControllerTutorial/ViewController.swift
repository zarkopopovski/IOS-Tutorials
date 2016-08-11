//
//  ViewController.swift
//  UIAlertControllerTutorial
//
//  Created by Zarko Popovski on 8/11/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelInfo: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showStandardAction(sender: UIButton) {
        let standardAlert = UIAlertController(title: "Info Message", message: "This is a standard alert message", preferredStyle: .Alert)
        
        let closeAction = UIAlertAction(title: "Close", style: .Default) { (newAction) in
            standardAlert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        standardAlert.addAction(closeAction)
        
        presentViewController(standardAlert, animated: true, completion: nil)
    }
    
    @IBAction func showEmailEntryAction(sender: UIButton) {
        let emailEntryAlert = UIAlertController(title: "Info Message", message: "Email Entry", preferredStyle: .Alert)
        
        emailEntryAlert.addTextFieldWithConfigurationHandler { (emailField) in
            emailField.placeholder = "JohnDoe@mymail.com"
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (newAction) in
            let emailField = emailEntryAlert.textFields![0] as UITextField
            
            let userEmail = emailField.text!
            
            self.labelInfo.text = "Your email: \(userEmail)"
            
            emailEntryAlert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let closeAction = UIAlertAction(title: "Close", style: .Destructive) { (newAction) in
            emailEntryAlert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        emailEntryAlert.addAction(okAction)
        emailEntryAlert.addAction(closeAction)
        
        presentViewController(emailEntryAlert, animated: true, completion: nil)
    }
    
    @IBAction func showStandardActionSheetAction(sender: UIButton) {
        let standardActionSheet = UIAlertController(title: "Info Message", message: "This is a standard action sheet", preferredStyle: .ActionSheet)
        
        let infoAction = UIAlertAction(title: "Info", style: .Default) { (newAction) in
            standardActionSheet.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (newAction) in
            standardActionSheet.dismissViewControllerAnimated(true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (newAction) in
            standardActionSheet.dismissViewControllerAnimated(true, completion: nil)
        }
        
        standardActionSheet.addAction(infoAction)
        standardActionSheet.addAction(okAction)
        standardActionSheet.addAction(cancelAction)
        
        presentViewController(standardActionSheet, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

