//
//  ViewController.swift
//  BookmarkIN
//
//  Created by Zarko Popovski on 5/2/17.
//  Copyright © 2017 ZPOTutorials. All rights reserved.
//

import UIKit

import SVProgressHUD
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
   
    let API_CONNECTOR = ApiConnector.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        let userEmail:String = self.txtUsername.text!
        let userPassword:String = self.txtPassword.text!
        
        SVProgressHUD.show(withStatus: "Loading")
        API_CONNECTOR.loginWithParams(userName: userEmail, password: userPassword, completition: { (hasError, result) in
            SVProgressHUD.dismiss()
            if !hasError {
                ApiConnector.sharedInstance.userID = result;
                
                let bookmarksListVC = self.storyboard?.instantiateViewController(withIdentifier: "BookmarksListVC") as! BookmarksListViewController
                self.show(bookmarksListVC, sender: nil)
            } else {
                let errorAlert = UIAlertController(title: "Error", message: result, preferredStyle: .alert)
                let alertClose = UIAlertAction(title: "Close", style: .cancel, handler: { (alert) in
                    self.dismiss(animated: true, completion: nil)
                })
                errorAlert.addAction(alertClose)
                self.present(errorAlert, animated: true, completion: nil)
            }
        })
    
    }

    @IBAction func btnRegisterAction(_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

