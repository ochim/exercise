//
//  Goods.m
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Goods.h"

@implementation Goods

- (void)setName:(NSString*)newName {
	[newName retain];
	[name release];
	name = newName;
}

- (NSString*)name {
	return name;
}

- (void)setPrice:(int)newPrice {
	price = newPrice;
}

- (int)price {
	return price;
}

- (NSString*)description {
	NSString* s = [NSString stringWithFormat:@"商品名：%@　価格：%d円", name, price];
	return s;
}

- (void)dealloc {
	[name release];
	[super dealloc];
}

@end
