//
//  GeneralCustomer.m
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MemberCustomer.h"

@implementation MemberCustomer

- (void) setNumber: (int) n {
    if (n >= 1) {
        number = n;
    }
}

- (int)number {
    return number;
}

- (void) print {
    NSLog(@"氏名:%@, 年齢:%d, 会員番号:%d", name, age, number);
}

@end
