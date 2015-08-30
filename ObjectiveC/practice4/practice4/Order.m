//
//  Order.m
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Order.h"

@implementation Order

- (id)init {
	if (self = [super init]) {
		goodsList = [[NSMutableArray alloc] initWithCapacity:0];
	}
	return self;
}

- (void)dealloc {
	[goodsList release];
	[customer release];
	[super dealloc];
}

- (int)addGoods:(Goods*)newGoods {
	[goodsList addObject:newGoods];
	return (int)[goodsList count];
}

- (Goods*)goodsAtIndex:(int)index {
    if (index < 0 || index >= [goodsList count]) {
        return nil;
    }
	return [goodsList objectAtIndex:index];
}

- (void)setCustomer:(Customer*)newCustomer {
	[newCustomer retain];
	[customer release];
	customer = newCustomer;
}

- (Customer*)customer {
	return customer;
}

- (void)print {
    NSLog(@"%@", customer);
	
	for (id goods in goodsList) {
        NSLog(@"%@", goods);
	}
}

@end
