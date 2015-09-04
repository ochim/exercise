//
//  SecondViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/05/25.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class SecondViewController: FirstViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.inputItems.addObject("ダッシュボード")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            println("choice: \(indexPath.row)")
        case 1:
            println("choice: \(indexPath.row)")
        case 2:
            println("choice: \(indexPath.row)")
        case 3:
            println("choice: \(indexPath.row)")
            performSegueWithIdentifier("DashboardSegue",sender: nil)

        default :
            println("Default: \(indexPath.row)")
        }
        
    }

}

