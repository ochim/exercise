//
//  GeneralCustomer.h
//  practice2
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface MemberCustomer : Customer
{
    int number;
}
- (void) setNumber: (int) n;
- (int) number;
- (void) print;

@end
