//
//  main.m
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "Customer.h"
#import "Goods.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Order* order = [[Order alloc] init];
		
		Customer* customer = [[Customer alloc] init];
		[customer setName:@"鈴木"];
		[order setCustomer:customer];
		[customer release];
		
		Goods* goods1 = [[Goods alloc] init];
		[goods1 setName:@"えんぴつ"];
		[goods1 setPrice:80];
        
		Goods* goods2 = [[Goods alloc] init];
		[goods2 setName:@"けしごむ"];
		[goods2 setPrice:50];
        
		Goods* goods3 = [[Goods alloc] init];
		[goods3 setName:@"ノート"];
		[goods3 setPrice:100];
		
		[order addGoods:goods1];
		[order addGoods:goods2];
		[order addGoods:goods3];

		[goods1 release];
		[goods2 release];
		[goods3 release];

		[order print];
		[order release];
    }	    

	while (1) {
		continue;
	}
	
    return 0;
}


