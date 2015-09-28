//
//  DashboardViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/06/23.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var heights: [HealthItem]? = []
    var weights: [HealthItem]? = []
    var pulses: [HealthItem]? = []
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var height: Height = Height()
        height.findAllItemsOnHealthcare({healthItems, error in
            
            if self.showErrorAlert(error) {
                return
            }
            self.heights! = healthItems!
        })
        
        var weight: Weight = Weight()
        weight.findAllItemsOnHealthcare({healthItems, error in
            
            if self.showErrorAlert(error) {
                return
            }
            self.weights! = healthItems!
        })
        
        var pulse: Pulse = Pulse()
        pulse.findAllItemsOnHealthcare({healthItems, error in
            
            if self.showErrorAlert(error) {
                return
            }
            self.pulses! = healthItems!
        })
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        mySegmentedControl.selectedSegmentIndex = 0;
        mySegmentedControl.addTarget(self, action: "segmentedControlChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showErrorAlert(error :NSError?) -> Bool {
        if error != nil {
            var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: error!.localizedDescription)
            self.presentViewController(builder.alertController, animated: true, completion: nil)
            return true
        }
        return false
    }

    func segmentedControlChanged(sender: UISegmentedControl) {
        println(sender.selectedSegmentIndex)
        myTableView.reloadData()
    }

    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index: Int = mySegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        var cell = tableView.dequeueReusableCellWithIdentifier("OutputItemCell") as? UITableViewCell
        
        if cell == nil {
            var cell: UITableViewCell! = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "OutputItemCell")
        }
        
        //we know that cell is not empty now so we use ! to force unwrapping
        
        cell!.textLabel?.text = "Baking Soda"
        cell!.detailTextLabel?.text = "cup"
        return cell!
    }
    
}
