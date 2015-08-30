//
//  Customer.h
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
	NSString* name;
	int age;
}
@property (nonatomic, copy) NSString* name;
@property (nonatomic) int age;

- (id)initWithName:(NSString*)newName;
- (id)initWithAge:(int)newAge;
- (id)initWithName:(NSString*)newName age:(int)newAge;
@end
