//
//  DashboardViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/06/23.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var height: Height = Height()
        height.findAllItemValues({responseObj, error in})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
