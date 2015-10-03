//
//  SecondViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/05/25.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class SecondViewController: FirstViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.inputItems.removeAllObjects()
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
        
        print("choice: \(indexPath.row)")
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("DashboardSegue",sender: nil)

        default :
            print("Default: \(indexPath.row)")
        }
    }

}

