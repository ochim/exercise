//
//  HealthItem.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/27.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import Foundation
import HealthKit

class HealthItem: NSObject {
    var unit : HKUnit!
    var type : HKQuantityType!
    var valueString : NSString!
    var startDate : NSDate!
    var endDate : NSDate!
    
    func save(completion: ((success: Bool, error: NSError!) -> Void)) {
        HKHealthStoreUtility.saveHealthValueWithUnit(unit, type: type, valueStr: valueString, startDate: startDate, endDate: endDate, completion: completion)
    }
}