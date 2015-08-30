//
//  Customer.h
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
    NSString *name;
    int age;
}
- (void) setName: (NSString*) n;
- (void) setAge: (int) a;
- (NSString*) name;
- (int) age;

@end
