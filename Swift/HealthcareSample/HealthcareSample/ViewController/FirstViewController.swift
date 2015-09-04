//
//  FirstViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/05/25.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let inputItems: NSMutableArray = ["身長", "体重", "心拍数"]
    var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "InputItemCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Num: \(indexPath.row)")
        println("Value: \(inputItems[indexPath.row])")
        
        switch indexPath.row {
            case 0:
                performSegueWithIdentifier("InputHeightSegue",sender: nil)
            case 1:
                performSegueWithIdentifier("InputWeightSegue",sender: nil)
            case 2:
                performSegueWithIdentifier("InputPulseSegue",sender: nil)
            default :
                println("Default: \(indexPath.row)")
        }
        
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("InputItemCell") as! UITableViewCell
        
        // Cellに値を設定する.
        cell.textLabel?.text = "\(inputItems[indexPath.row])"
        
        return cell
    }
    
}

