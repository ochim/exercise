//
//  main.m
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SwimingSchool.h"
#import "GeneralCustomer.h"
#import "MemberCustomer.h"
#import "ChildCustomer.h"

/*　
 このプロジェクトはメモリ管理をしていません
*/

int main (int argc, const char * argv[])
{
    @autoreleasepool {
        
        SwimingSchool *school = [SwimingSchool new];
        
        GeneralCustomer *gc = [GeneralCustomer new];
        [gc setName:@"TANAKA"];
        [gc setAge:30];
        
        MemberCustomer *mc = [MemberCustomer new];
        [mc setName:@"YAMAMOTO"];
        [mc setAge:28];
        [mc setNumber:201];
        
        ChildCustomer *cc = [ChildCustomer new];
        [cc setName:@"KIDO"];
        [cc setAge:10];
        
        [school setCustomer:gc atIndex:0];
        [school setCustomer:mc atIndex:1];
        [school setCustomer:cc atIndex:2];
        
        [school print];

    }
    return 0;
}

