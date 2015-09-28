//
//  DashboardViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/06/23.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
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
    
}
