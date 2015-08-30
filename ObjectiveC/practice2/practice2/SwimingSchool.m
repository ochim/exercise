//
//  SwimingSchool.m
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SwimingSchool.h"

@implementation SwimingSchool

- (id)init {
    self = [super init];
    if (self) {
        name = @"HATSUDAI SWIM CLUB";
    }
    return self;
}

- (NSString *)name {
    return name;
}

- (void)setName:(NSString *)aName {
    name = aName;
}

- (id)customerAtIndex:(int)index {
    if (index < 0 || index > 2) {
        return nil;
    }
    return customers[index];
}
- (void)setCustomer:(id)cust atIndex:(int)index {
    if (index < 0 || index > 2) {
        return;
    }
    customers[index] = cust;
}

- (void) print {
    NSLog(@"スクール名：%@", name);
    [customers[0] print];
    [customers[1] print];
    [customers[2] print];
}

@end
