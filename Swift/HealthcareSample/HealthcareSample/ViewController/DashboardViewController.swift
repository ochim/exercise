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
        let height: Height = Height()
        height.findAllItemsOnHealthcare({healthItems, error in
            
            if self.showErrorAlert(error) {
                return
            }
            self.heights! = healthItems!
        })
        
        let weight: Weight = Weight()
        weight.findAllItemsOnHealthcare({healthItems, error in
            
            if self.showErrorAlert(error) {
                return
            }
            self.weights! = healthItems!
        })
        
        let pulse: Pulse = Pulse()
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
            let builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: error!.localizedDescription)
            self.presentViewController(builder.alertController, animated: true, completion: nil)
            return true
        }
        return false
    }

    func segmentedControlChanged(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
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
            return self.heights!.count
        case 1:
            return self.weights!.count
        case 2:
            return self.pulses!.count
        default:
            return 0
        }
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        var cell = tableView.dequeueReusableCellWithIdentifier("OutputItemCell")
        
        let index: Int = mySegmentedControl.selectedSegmentIndex
        switch index {
        case 0:
            let height: HealthItem = self.heights![indexPath.row]
            cell!.textLabel?.text = String(format: "%.2f cm", height.valueString.doubleValue * 100)
            cell!.detailTextLabel?.text = self.formattedStringFromDate(height.startDate)
            
        case 1:
            let weight: HealthItem = self.weights![indexPath.row]
            cell!.textLabel?.text = String(format: "%.2f kg", weight.valueString.doubleValue / 1000)
            cell!.detailTextLabel?.text = self.formattedStringFromDate(weight.startDate)

        case 2:
            let pulse: HealthItem = self.pulses![indexPath.row]
            cell!.textLabel?.text = String(format: "%.f 拍/分", pulse.valueString.doubleValue)
            cell!.detailTextLabel?.text = self.formattedStringFromDate(pulse.startDate)
        
        default:
            cell!.textLabel?.text = "hoge"
            cell!.detailTextLabel?.text = "foo"
        }
        
        return cell!
    }
    
    func formattedStringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        dateFormatter.locale = NSLocale.currentLocale()
        return dateFormatter.stringFromDate(date)
    }
}
