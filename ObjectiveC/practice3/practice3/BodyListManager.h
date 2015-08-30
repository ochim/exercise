//
//  BodyListManager.h
//  practice3
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    man,
    woman
} Gender;

typedef struct {
    double height;
    double weight;
    Gender gender;
} BodyData;

@interface BodyListManager : NSObject
{
    NSMutableDictionary *bodyList;
    NSString *schoolName;
}

- (void)addBody:(NSValue *)body forName:(NSString *)name;
- (NSValue *)bodyAtName:(NSString *)name;
- (void)setSchoolName:(NSString *)name;
- (NSString *)schoolName;

@end
