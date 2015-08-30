//
//  ChildCustomer.m
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ChildCustomer.h"
#import "School.h"

@implementation ChildCustomer
@synthesize school;
@synthesize grade;

- (NSString*)description {
	NSString* s = [NSString stringWithFormat:@"顧客名：%@ %d歳　%@　%d年生", self.name, self.age, self.school.name, self.grade];
	return s;
}

- (void)dealloc {
	[school release];
	[super dealloc];
}

/*
- (id)init {
	if (self = [self initWithName:@"未設定" age:0]) {
	}
	return self;
}
*/

- (id)initWithName:(NSString*)newName age:(int)newAge {
	School *newSchool = [[School alloc] init]; 
	if (self = [self initWithName:newName age:newAge school:newSchool grade:1]) {
	}
    [newSchool release];
	return self;
}

// 指定イニシャライザ
- (id)initWithName:(NSString *)newName age:(int)newAge school:(School*)newSchool grade:(int)newGrade {

	if (self = [super initWithName:newName age:newAge]) {
		self.school = newSchool;
		self.grade = newGrade;
	}
	return self;
}

- (id)initWithName:(NSString *)newName school:(School*)newSchool {
	if (self = [self init]) {
        self.name = newName;
        self.school = newSchool;
	}
	return self;
}


@end
