//
//  InputPulseViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/26.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class InputPulseViewController: InputItemViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "心拍数（脈拍）"
        numberUnitLabel.text = "単位 拍/分"
        numberField.keyboardType = UIKeyboardType.NumberPad
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
    
    //ボタンがクリックされると呼ばれます
    override func tapSaveButton(sender: UIButton){
        numberField.resignFirstResponder();
        print("save")
        savePulse()
    }
    
    func savePulse() {
        
        let tempValue: Double = NSString(string: numberField.text!).doubleValue
        
        if (tempValue == 0) {
            print("入力必須")
            let builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: NSLocalizedString("VALIDATION_MESSAGE", comment: "comment"))
            self.presentViewController(builder.alertController, animated: true, completion: nil)
            return
        }
        
        let pulse:Pulse = Pulse()
        pulse.valueString = NSString(format: "\(tempValue)")
        pulse.startDate = NSDate();
        pulse.endDate = NSDate();
        
        // ヘルスケアに心拍数データを保存
        pulse.save { (success, error) -> Void in
            if error != nil {
                let builder:SimpleAlertBuilder = SimpleAlertBuilder(title: "", message: error!.localizedDescription)
                self.presentViewController(builder.alertController, animated: true, completion: nil)
                return
            }
            
            if success {
                let builder:SimpleAlertBuilder = SimpleAlertBuilder(title: NSLocalizedString("SAVE_ON_HEALTHCARE", comment: "comment"), message: "")
                self.presentViewController(builder.alertController, animated: true, completion: nil)
            }
        }
    }
}
