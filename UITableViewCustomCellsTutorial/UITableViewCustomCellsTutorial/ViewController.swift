//
//  ViewController.swift
//  UITableViewCustomCellsTutorial
//
//  Created by Zarko Popovski on 9/17/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let complexDataStructure = [["image":"icon1.png","name":"Burger","category":"Fast Food","price":"80"],
                                ["image":"icon2.png","name":"HotDog","category":"Fast Food","price":"60"],
                                ["image":"icon3.png","name":"Vege Soup","category":"Food","price":"40"],
                                ["image":"icon4.png","name":"Tea","category":"Drink","price":"20"],
                                ["image":"icon5.png","name":"Cake","category":"Food","price":"30"],
                                ["image":"icon6.png","name":"Pizza","category":"Fast Food","price":"100"],
                                ["image":"icon7.png","name":"Caffee","category":"Drink","price":"40"],
                                ["image":"icon8.png","name":"Shake","category":"Drink","price":"40"],
                                ["image":"icon9.png","name":"Cake","category":"Drink","price":"80"],
                                ["image":"icon10.png","name":"Milk","category":"Drink","price":"20"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complexDataStructure.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        
        let cell : ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! ProductTableViewCell
        
        let rowObject = self.complexDataStructure[indexPath.row]
        
        cell.productImageView.image = UIImage(named: rowObject["image"]!)
        cell.productNameLabel.text = rowObject["name"]
        cell.categoryNameLabel.text = rowObject["category"]
        cell.priceLabel.text = rowObject["price"]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

