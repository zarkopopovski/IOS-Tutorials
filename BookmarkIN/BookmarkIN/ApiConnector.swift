//
//  ApiConnector.swift
//  BookmarkIN
//
//  Created by Zarko Popovski on 5/3/17.
//  Copyright © 2017 ZPOTutorials. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class ApiConnector: NSObject {
    
    static let sharedInstance = ApiConnector()
    
    let BASE_URL = "http://localhost:8080"
    let API_LOGIN = "/login_user"
    let API_LIST_GROUPS = "/list_groups"
    let API_ADD_BOOKMARK = "/create_bookmark"
    let API_LIST_BOOKMARKS = "/list_bookmarks"
    
    var userID = ""
    
    
    func loginWithParams(userName:String, password:String, completition:@escaping (Bool ,String) -> ())
    {
        let apiParams:[String:String] = ["username":userName, "password":password]
        
        Alamofire.request(BASE_URL+""+API_LOGIN, method: .post, parameters:apiParams)
            .responseJSON { response in
                let jsonData = JSON(response.result.value!)
                
                if jsonData["id"].exists() {
                    let jsonResult = jsonData["id"].string!
                    
                    completition(false, jsonResult)
                } else {
                    let jsonResult = jsonData["id"].string!
                    
                    completition(true, jsonResult)
                }
        }
    }
    
    func createNewBookmark(bookmarkURL:String, completition:@escaping (Bool ,String) -> ())
    {
        let apiParams:[String:String] = ["user_id":self.userID, "bookmark_group":"111", "bookmark_url":bookmarkURL]
        
        Alamofire.request(BASE_URL+""+API_ADD_BOOKMARK, method: .post, parameters:apiParams)
            .responseJSON { response in
                
                if (response.result.value != nil) {
                    
                    completition(false, "")
                } else {
                    
                    completition(true, "")
                }
        }
    }
    
    func findAllGroups(completition: @escaping (Bool, [[String:String]]) -> ())
    {
        
        var groupsArray:[[String:String]] = [[String:String]]()
        
        let apiParams:[String:String] = ["user_id":self.userID]
        
        Alamofire.request(BASE_URL+""+API_LIST_GROUPS, method: .post, parameters:apiParams)
            .responseJSON { response in
                let jsonData = JSON(response.result.value).array
                
                if jsonData != nil && (jsonData?.count)! > 0 {
                    for i in 0 ..< (jsonData?.count)! {
                        let jsonObject = jsonData?[i].object
                        
                        groupsArray.append(jsonObject as! [String : String])
                    }
                    
                    completition(false, groupsArray)
                } else {
                    completition(true, [])
                }
        }
    }
    
    func findAllBookmarks(completition: @escaping (Bool, [[String:String]]) -> ())
    {
        
        var bookmarksArray:[[String:String]] = [[String:String]]()
        
        let apiParams:[String:String] = ["user_id":self.userID, "group_id":"111"]
        
        Alamofire.request(BASE_URL+""+API_LIST_BOOKMARKS, method: .post, parameters:apiParams)
            .responseJSON { response in
                let jsonData = JSON(response.result.value).array
                
                if jsonData != nil && (jsonData?.count)! > 0 {
                    for i in 0 ..< (jsonData?.count)! {
                        let jsonObject = jsonData?[i].object
                        
                        bookmarksArray.append(jsonObject as! [String : String])
                    }
                    
                    completition(false, bookmarksArray)
                } else {
                    completition(true, [])
                }
        }
    }



}
