//
//  Goods.h
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject
{
	NSString* name;
	int price;
}

- (void)setName:(NSString*)newName;
- (NSString*)name;
- (void)setPrice:(int)newPrice;
- (int)price;

@end
