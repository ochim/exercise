//
//  SimpleAlertBuilder.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/27.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class SimpleAlertBuilder: NSObject {
    var alertController: UIAlertController
    
    init(title: String, message: String) {

        // UIAlertView
        self.alertController = UIAlertController(title:title,
            message:message,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        // Cancel 一つだけしか指定できない
        let cancelAction:UIAlertAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction!) -> Void in
        })
        
        alertController.addAction(cancelAction)
    }
    
}