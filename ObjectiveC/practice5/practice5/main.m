//
//  main.m
//  practice5
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "School.h"
#import "ChildCustomer.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		School* school = [[School alloc] init];
		school.name = @"初台小学校";
		
		Customer* customer = [[Customer alloc] initWithName:@"鈴木" age:30];
		ChildCustomer* childCustomer1 = [[ChildCustomer alloc] initWithName:@"田中" age:10 school:school grade:4];
		ChildCustomer* childCustomer2 = [[ChildCustomer alloc] initWithName:@"山本" age:8 school:school grade:2];
		
		NSArray *customers = [NSArray arrayWithObjects:customer, childCustomer1, childCustomer2, nil];
		for (id cust in customers) {
			NSLog(@"%@", cust);
		}
		
		[school release];
		[customer release];
		[childCustomer1 release];
		[childCustomer2 release];
        
        //ほかのイニシャライザの動作確認
		School* school2 = [[[School alloc] init] autorelease];
		school2.name = @"新宿小学校";
        ChildCustomer* childCustomer3 = [[ChildCustomer alloc] init];
        ChildCustomer* childCustomer4 = [[ChildCustomer alloc] initWithName:@"佐藤" school:school2];
        NSLog(@"%@", childCustomer3);
        NSLog(@"%@", childCustomer4);
        [childCustomer3 release];
        [childCustomer4 release];
	}
    
    return 0;
}