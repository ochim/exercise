//
//  Height.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/26.
//  Copyright (c) 2015年 ochi. All rights reserved.
//
//  心拍数

import Foundation
import HealthKit

class Pulse: HealthItem {
    
    override init() {
        super.init()
        // 単位は拍/分
        self.unit = HKUnit.countUnit().unitDividedByUnit(HKUnit.minuteUnit())
        self.type = HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)
    }
    
}