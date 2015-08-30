//
//  ChildCustomer.h
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Customer.h"
@class School;

@interface ChildCustomer : Customer
{
	School* school;
	int grade;
}
@property (nonatomic, retain) School* school;
@property (nonatomic) int grade;

- (id)initWithName:(NSString *)newName school:(School*)newSchool;
- (id)initWithName:(NSString *)newName age:(int)newAge school:(School*)newSchool grade:(int)newGrade;
@end
