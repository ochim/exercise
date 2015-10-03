//
//  InputHeightViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/06/15.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit
import HealthKit

class InputHeightViewController: InputItemViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "身長"
        numberUnitLabel.text = "単位 cm"
        numberField.delegate = self
        dateField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //編集直後
    func textFieldDidBeginEditing(textField: UITextField){
    }
    
    //編集完了後（完了直前）
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    //編集完了後（完了直後）
    func textFieldDidEndEditing(textField: UITextField){
        textField.resignFirstResponder()
    }
    
    //改行時
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func tapSaveButton(sender: UIButton){
        numberField.resignFirstResponder();
        print("save")
        saveHeight()
    }
    
    func saveHeight() {
        var tempValue: Double! = NSString(string: numberField.text!).doubleValue
        
        if (tempValue == 0) {
            print("入力必須")
            var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: NSLocalizedString("VALIDATION_MESSAGE", comment: "comment"))
            self.presentViewController(builder.alertController, animated: true, completion: nil)
            return
        }
        
        var height: Height = Height()
        // 値をメートルに変換
        height.valueString = NSString(format: "\(tempValue / 100)")
        height.startDate = NSDate();
        height.endDate = NSDate();
        
        // ヘルスケアに身長データを保存
        // 同じ日時で保存しても別データ扱い
        height.save { (success, error) -> Void in
            if error != nil {
                var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: error!.localizedDescription)
                self.presentViewController(builder.alertController, animated: true, completion: nil)
                return
            }
            
            if success {
                var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: NSLocalizedString("SAVE_ON_HEALTHCARE", comment: "comment"), message: "")
                self.presentViewController(builder.alertController, animated: true, completion: nil)
            }
        }
        
    }
    
}

