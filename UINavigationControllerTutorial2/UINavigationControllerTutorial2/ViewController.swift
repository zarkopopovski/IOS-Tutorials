//
//  ViewController.swift
//  UINavigationControllerTutorial2
//
//  Created by Zarko Popovski on 8/15/16.
//  Copyright © 2016 ZPOTutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "First UIViewController"
    }
    
    @IBAction func showSecondAction(sender: UIButton) {
        let secondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func showThirdAction(sender: UIButton) {
        let thirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        navigationController?.pushViewController(thirdViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

