//
//  HKHealthStoreUtility.swift
//  HealthcareSample
//
//  Created by 越智 宗洋 on 2015/08/10.
//  Copyright (c) 2015年 ochi. All rights reserved.
//

import Foundation
import HealthKit

class HKHealthStoreUtility: NSObject {
    
    /**
    引数に渡された文字列を指定のデータへ変換してHealthStoreへ永続化します。
    渡される文字列は、Double型へキャスト出来る形式である必要があります。
    
    :param: unit       健康情報の単位型
    :param: type       健康情報のデータ型
    :param: valueStr   データ文字列
    :param: startDate  計測開始日
    :param: endDate   計測終了日
    :param: completion 永続化処理完了時に実行される処理
    */
    static func saveHealthValueWithUnit(unit: HKUnit! , type: HKQuantityType!, valueStr: NSString!, startDate: NSDate!, endDate: NSDate!, completion: ((success: Bool, error: NSError!) -> Void)) {

        let healthStore: HKHealthStore = HKHealthStore()
        
        // 数値オブジェクトを生成します。単位と値が入ります。
        let quantity: HKQuantity = HKQuantity(unit: unit, doubleValue: valueStr.doubleValue)
        
        // HKObjectのサブクラスである、HKQuantitySampleオブジェクトを生成します。
        // 計測の開始時刻と終了時刻が同じ場合は同じ値を設定します。
        let sample: HKQuantitySample = HKQuantitySample(type: type, quantity: quantity, startDate: startDate, endDate: endDate)
        
        // 健康情報のデータ型を保持したNSSetオブジェクトを生成します。
        // 永続化したい情報が複数ある場合はobjectに複数のデータ型配列を設定します。
        let types: Set<NSObject>! = Set(arrayLiteral: type)
        
        let authStatus:HKAuthorizationStatus = healthStore.authorizationStatusForType(type)
        
        if authStatus == .SharingAuthorized {
            healthStore.saveObject(sample, withCompletion:completion)
        } else {
            
            // HealthStoreに永続化するために、ユーザーへ許可を求めます。
            // 第1引数に指定したNSSet!型のshareTypesの書き込み許可を求めます。
            // 第2引数に指定したNSSet!型のreadTypesの読み込み許可を求めます。
        
            healthStore.requestAuthorizationToShareTypes(types, readTypes:types ,completion:{
                success, error in
                
                if error != nil {
                    println(error.description);
                    return
                }
                
                if success {
                    println("保存可能");
                    healthStore.saveObject(sample, withCompletion:completion)
                }
            })
        }
    }
    
    /*
    HealthStoreから引数に渡されたデータ型に一致する健康情報を全件取得します。
    
    :param: unit       健康情報の単位型
    :param: type       取得したいデータ型
    :param: completion 取得完了時に実行される処理
    */
    static func findAllHealthValueWithUnit(unit: HKUnit!, type: HKQuantityType!, completion: ((query: HKSampleQuery!, responseObj: [AnyObject]!, error: NSError!) -> Void)) {
        let healthStore = HKHealthStore()
        
        // HealthStoreのデータを全件取得するHKSampleQueryを返却します。
        let findAllQuery : () -> HKSampleQuery = {
            return HKSampleQuery(sampleType: type, predicate: nil, limit: 0, sortDescriptors: nil, resultsHandler: completion)
        }
        
        let types: Set<NSObject>! = Set(arrayLiteral: type)
        
        let authStatus:HKAuthorizationStatus = healthStore.authorizationStatusForType(type)
        
        if authStatus == .SharingAuthorized {
            healthStore.executeQuery(findAllQuery())
        } else {
            
            // 第1引数に指定したNSSet!型のshareTypesの書き込み許可を求めます。
            // 第2引数に指定したNSSet!型のreadTypesの読み込み許可を求めます。
            
            healthStore.requestAuthorizationToShareTypes(types, readTypes: types) {
                success, error in
                
                if error != nil {
                    println(error.description);
                    return
                }
                
                if success {
                    println("取得可能");
                    // 引数に指定されたクエリーを実行します
                    healthStore.executeQuery(findAllQuery())
                }
            }
        }
    }
    
}
