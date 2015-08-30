//
//  BodyListManager.m
//  practice3
//
//  Created by Ochim on 12/12/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BodyListManager.h"

@implementation BodyListManager

- (id)init {
    if (self = [super init]) {
        bodyList = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    return self;
}

- (void)addBody:(NSValue *)body forName:(NSString *)name {
    [bodyList setObject:body forKey:name];
}

- (NSValue *)bodyAtName:(NSString *)name {
    return [bodyList objectForKey:name];
}

- (void)setSchoolName:(NSString *)name {
    schoolName = name;
}

- (NSString *)schoolName {
    return schoolName;
}

- (NSString *)description {
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"学校名：%@\n", schoolName];
    
    for (NSString *name in [bodyList keyEnumerator]) {
        NSValue *body = [bodyList objectForKey:name];
        BodyData data;
        [body getValue:&data];
        NSString *sex = (data.gender == woman) ? @"女性" : @"男性";
        
        [string appendFormat:@"%@ %.1fcm %.1fkg %@\n",
                            name, data.height, data.weight, sex];
    }
    return string;
}

@end
