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
    
    func findAllItemsOnHealthcare(completion: (responseObjects:[HealthItem]?, error: NSError?) -> Void) {
        
        // 取得処理完了時に非同期で呼び出されます。
        HKHealthStoreUtility.findAllHealthValueWithUnit(self.unit, type: self.type , completion: {
            query, responseObj, error in
            
            if error != nil {
                NSLog(error.description)
                completion(responseObjects:nil, error: error!)
                return
            }
            
            // 取得した結果がresponseObjに格納されています。
            // アプリケーションで使用する場合、[AnyObject]!型のresponseObjを必要な型にキャストする必要があります。
            NSLog("resultObj : \(responseObj)")
            
            let btUnit: HKUnit = self.unit
            var healthItems: [HealthItem]? = []
            
            // HealthStoreで使用していた型から値へと復元します。
            for item: HKQuantitySample in responseObj as! [HKQuantitySample] {
                // 値を取得します。
                let btQuantity: HKQuantity! = item.quantity
                let btResult: Double = btQuantity.doubleValueForUnit(btUnit)
                
                var healthItem = HealthItem()
                healthItem.unit = self.unit
                healthItem.type = self.type
                healthItem.valueString = NSString(format: "%f", btResult)
                healthItem.startDate = item.startDate
                healthItem.endDate = item.endDate
                
                healthItems!.append(healthItem)
            }
            completion(responseObjects: healthItems!, error: nil)
        })
    }
}