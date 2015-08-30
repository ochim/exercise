//
//  ChildCustomer.m
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ChildCustomer.h"

@implementation ChildCustomer

- (void) setAge: (int) a {
    if (a >= 0 && a <= 12) {
        age = a;
    }
}

- (void) print {
    NSLog(@"氏名:%@, 年齢:%d", name, age);
}

@end
