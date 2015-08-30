//
//  main.m
//  practice3
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BodyListManager.h"

/*　
 このプロジェクトはメモリ管理をしていません
 */

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        BodyListManager *manager = [BodyListManager new];
        [manager setSchoolName:@"初台高校"];

        NSString *name1 = @"TANAKA";
        BodyData data1 = {150.2, 63.2, man};
        NSString *name2 = @"HIRAKAWA";
        BodyData data2 = {175.6, 69.5, man};
        NSString *name3 = @"MORITA";
        BodyData data3 = {160.4, 51.0, woman};
        
        [manager addBody:[NSValue valueWithBytes:&data1 objCType:@encode(BodyData)]
                 forName:name1];
        [manager addBody:[NSValue valueWithBytes:&data2 objCType:@encode(BodyData)]
                 forName:name2];
        [manager addBody:[NSValue valueWithBytes:&data3 objCType:@encode(BodyData)]
                 forName:name3];
        
        NSLog(@"%@",manager);
        
    }
    return 0;
}

