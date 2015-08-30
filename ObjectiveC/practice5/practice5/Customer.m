//
//  Customer.m
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Customer.h"

@implementation Customer
@synthesize name;
@synthesize age;

- (NSString*)description {
	NSString *s = [NSString stringWithFormat:@"顧客名：%@ %d歳", name, age];
	return s;
}

// 指定イニシャライザ
- (id)initWithName:(NSString*)newName age:(int)newAge {
	if (self = [super init]) {
		self.name = newName;
		self.age = newAge;
	}
	return self;
}

- (id)init {
	if (self = [self initWithName:@"未設定" age:0]) {
	}
	return self;
}

- (id)initWithName:(NSString*)newName {
	if (self = [self initWithName:newName age:0]) {
	}
	return self;
}

- (id)initWithAge:(int)newAge {
	if (self = [self initWithName:@"未設定" age:newAge]) {
	}
	return self;
}


- (void)dealloc {
	[name release];
	[super dealloc];
}

@end
