//
//  Order.h
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Customer;
@class Goods;

@interface Order : NSObject
{
	NSMutableArray* goodsList;
	Customer* customer;
}

- (int)addGoods:(Goods*)newGoods;
- (Goods*)goodsAtIndex:(int)index;
- (void)setCustomer:(Customer*)newCustomer;
- (Customer*)customer;
- (void)print;

@end
