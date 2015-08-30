//
//  Customer.h
//  practice4
//
//  Created by 越智 宗洋 on 12/12/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject
{
	NSString* name;
}

- (void)setName:(NSString*)newName;
- (NSString*)name;
@end
