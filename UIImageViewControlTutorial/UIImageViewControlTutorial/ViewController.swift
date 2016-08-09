//
//  ViewController.swift
//  UIImageViewControlTutorial
//
//  Created by Zarko Popovski on 8/9/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchImage: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage.init(named: "photo1.png")
    }

    @IBAction func switchImageAction(sender: UISwitch) {
        
        if sender.on
        {
            imageView.image = UIImage.init(named: "photo1.png")
        }
        else
        {
            imageView.image = UIImage.init(named: "photo2.png")
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

