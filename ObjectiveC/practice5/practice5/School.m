//
//  School.m
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "School.h"

@implementation School
@synthesize name;

- (id)init {
	if (self = [super init]) {
		self.name = @"小学校";
	}
	return self;
}

- (void)dealloc {
	[name release];
	[super dealloc];
}

- (NSString*)description {
	NSString *s = [NSString stringWithFormat:@"%@", name];
	return s;
}

@end
