//
//  Customer.m
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Customer.h"

@implementation Customer

- (void)setName:(NSString*)newName {
	[newName retain];
	[name release];
	name = newName;
}

- (NSString*)name {
	return name;
}

- (NSString*)description {
	NSString* s = [[NSString alloc] initWithFormat:@"顧客名：%@", name];
	return [s autorelease];
}

- (void)dealloc {
	[name release];
	[super dealloc];
}

@end
