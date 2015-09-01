//
//  Height.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/26.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import Foundation
import HealthKit

class Weight: HealthItem {

    override init() {
        super.init()
        self.unit = HKUnit.gramUnit()
        self.type = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    }
    
}