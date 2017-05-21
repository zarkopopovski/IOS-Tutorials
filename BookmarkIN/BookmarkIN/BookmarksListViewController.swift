//
//  BookmarksListViewController.swift
//  BookmarkIN
//
//  Created by Zarko Popovski on 5/2/17.
//  Copyright © 2017 ZPOTutorials. All rights reserved.
//

import UIKit

import SVProgressHUD
import SwiftyJSON

class BookmarksListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var bookmarksTableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    let API_CONNECTOR = ApiConnector.sharedInstance
    
    var userBookmarks:[[String:String]] = [[String:String]]()
    var userGroups:[[String:String]] = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.reloadBookmarksData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userBookmarks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CELL_ID = "Cell"
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        
        let bookmarkData = self.userBookmarks[indexPath.row]
        cell.textLabel?.text = bookmarkData["title"]
        cell.detailTextLabel?.text = bookmarkData["url"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        let bookmarkURLEntryAlert = UIAlertController(title: "Bookmark Entry", message: "URL Field", preferredStyle: .alert)
        
        bookmarkURLEntryAlert.addTextField { (urlField) in
            urlField.placeholder = ""
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (newAction) in
            let urlField = bookmarkURLEntryAlert.textFields![0] as UITextField
            
            let bookmarkURL = urlField.text!
            
            SVProgressHUD.show(withStatus: "Loading")
            self.API_CONNECTOR.createNewBookmark(bookmarkURL: bookmarkURL, completition: {(hasError, result) in
                SVProgressHUD.dismiss()
                if !hasError {
                    self.reloadBookmarksData()
                } else {
                    let errorAlert = UIAlertController(title: "Error", message: "Error saving.", preferredStyle: .alert)
                    let alertClose = UIAlertAction(title: "Close", style: .cancel, handler: { (alert) in
                        self.dismiss(animated: true, completion: nil)
                    })
                    errorAlert.addAction(alertClose)
                    self.present(errorAlert, animated: true, completion: nil)
                }
                
            })
            
        }
        
        let closeAction = UIAlertAction(title: "Close", style: .destructive) { (newAction) in
            bookmarkURLEntryAlert.dismiss(animated: true, completion: nil)
        }
        
        bookmarkURLEntryAlert.addAction(okAction)
        bookmarkURLEntryAlert.addAction(closeAction)
        
        present(bookmarkURLEntryAlert, animated: true, completion: nil)
    }
    
    func reloadBookmarksData() {
        SVProgressHUD.show(withStatus: "Loading")
        API_CONNECTOR.findAllBookmarks(completition: {(hasError, result) in
            SVProgressHUD.dismiss()
            if !hasError {
                self.userBookmarks = result
                
                self.bookmarksTableView.reloadData()
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "No data.", preferredStyle: .alert)
                let alertClose = UIAlertAction(title: "Close", style: .cancel, handler: { (alert) in
                    self.dismiss(animated: true, completion: nil)
                })
                errorAlert.addAction(alertClose)
                self.present(errorAlert, animated: true, completion: nil)
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
