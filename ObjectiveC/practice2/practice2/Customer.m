//
//  Customer.m
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (NSString*) name {
    return name;
}

- (int) age {
    return age;
}

- (void) setName: (NSString*) n {
    name = n;
}

- (void) setAge: (int) a {
    if (a >= 0 && a < 100) {
        age = a;
    }
}

@end
