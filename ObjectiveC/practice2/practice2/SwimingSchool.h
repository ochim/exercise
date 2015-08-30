//
//  SwimingSchool.h
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwimingSchool : NSObject
{
    NSString *name;
    id customers[3];
}

- (NSString *)name;
- (void)setName:(NSString *)aName;

- (id)customerAtIndex:(int)index;
- (void)setCustomer:(id)cust atIndex:(int)index;

- (void) print;

@end
