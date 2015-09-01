//
//  InputWeightViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/26.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit
import HealthKit

class InputWeightViewController: InputItemViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "体重"
        numberUnitLabel.text = "単位 kg"
        numberField.delegate = self
        dateField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //編集直後
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }
    
    //編集完了後（完了直前）
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        return true
    }
    
    //編集完了後（完了直後）
    func textFieldDidEndEditing(textField: UITextField){
        textField.resignFirstResponder()
        println("textFieldDidEndEditing:" + textField.text)
    }
    
    //改行時
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func tapSaveButton(sender: UIButton){
        numberField.resignFirstResponder();
        println("save")
        saveWeight()
    }
    
    func saveWeight() {
        var tempValue: Double? = NSString(string: numberField.text).doubleValue
        
        if (tempValue == 0) {
            println("入力必須")
            var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: NSLocalizedString("VALIDATION_MESSAGE", comment: "comment"))
            self.presentViewController(builder.alertController, animated: true, completion: nil)
            return
        }
        
        var weight: Weight = Weight()
        // 値をgに変換
        weight.valueString = NSString(format: "\(tempValue! * 1000)")
        weight.startDate = NSDate();
        weight.endDate = NSDate();
        
        // ヘルスケアに体重データを保存
        weight.save { (success, error) -> Void in
            if error != nil {
                var builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: error.localizedDescription)
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
