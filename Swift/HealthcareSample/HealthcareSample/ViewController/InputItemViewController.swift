//
//  InputItemViewController.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/06/23.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import UIKit

class InputItemViewController: UIViewController {
    
    var numberField = UITextField(frame: CGRectMake(0,0,200,30))
    let numberUnitLabel: UILabel = UILabel(frame: CGRectMake(0,0,100,30))
    let dateField: UITextField = UITextField(frame: CGRectMake(0,0,200,30))
    let saveButton: UIButton = UIButton(frame: CGRectMake(0,0,100,30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        saveButton.center = self.view.center
        saveButton.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0);
        saveButton.addTarget(self, action: "tapSaveButton:", forControlEvents:.TouchUpInside);
        saveButton.setTitle("save", forState: UIControlState.Normal);
        
        numberField.center = CGPointMake(saveButton.center.x, saveButton.center.y - 60.0)
        
        numberUnitLabel.center = CGPointMake(numberField.center.x, numberField.center.y - 60.0)
        numberUnitLabel.textAlignment = NSTextAlignment.Center;

        numberField.borderStyle = UITextBorderStyle.RoundedRect
        numberField.keyboardType = UIKeyboardType.DecimalPad
        
        self.view.addSubview(numberField)
        self.view.addSubview(numberUnitLabel)
        self.view.addSubview(saveButton);
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        numberField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ボタンがクリックされると呼ばれます
    func tapSaveButton(sender: UIButton){
    }
    
}
