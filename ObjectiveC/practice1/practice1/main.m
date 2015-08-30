//
//  main.m
//  practice1
//
//  Created by Ochim on 12/11/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*　
 このプロジェクトはメモリ管理をしていません
*/


//void printCustomer (id customers[], int count);

@interface GeneralCustomer : NSObject
{
    NSString *name;
    int age;
}

- (void) setName: (NSString*) n;
- (void) setAge: (int) a;
- (void) print;

@end 


@implementation GeneralCustomer

- (void) setName: (NSString*) n {
    name = n;
}

- (void) setAge: (int) a {
    if (a >= 0 && a < 100) {
        age = a;
    }
}

- (void) print {
    NSLog(@"氏名:%@, 年齢:%d", name, age);
}

@end 

@interface MemberCustomer : NSObject
{
    NSString *name;
    int age;
    int number;
}

- (void) setName: (NSString*) n;
- (void) setAge: (int) a;
- (void) setNumber: (int) n;

- (void) print;

@end 


@implementation MemberCustomer

- (void) setName: (NSString*) n {
    name = n;
}

- (void) setAge: (int) a {
    if (a >= 0 && a < 100) {
        age = a;
    }
}

- (void) setNumber: (int) n {
    if (n >= 1) {
        number = n;
    }
}

- (void) print {
    NSLog(@"氏名:%@, 年齢:%d, 会員番号:%d", name, age, number);
}

@end

@interface ChildCustomer : NSObject
{
    NSString *name;
    int age;
}

- (void) setName: (NSString*) n;
- (void) setAge: (int) a;

- (void) print;

@end 

@implementation ChildCustomer

- (void) setName: (NSString*) n {
    name = n;
}

- (void) setAge: (int) a {
    if (a >= 0 && a <= 12) {
        age = a;
    }
}

- (void) print {
    NSLog(@"氏名:%@, 年齢:%d", name, age);
}

@end 


void printCustomer (id customers[], int count){
    
    int i;
    
    for (i = 0; i < count; i++) {
        id cust = customers[i];
        [cust print];
    }
}

int main (int argc, const char * argv[]) 
{
        id cust[3];
        
        cust[0] = [GeneralCustomer new];
        [cust[0] setName:@"TANAKA"];
        [cust[0] setAge:30];
        
        cust[1] = [MemberCustomer new];
        [cust[1] setName:@"YAMAMOTO"];
        [cust[1] setAge:28];
        [cust[1] setNumber:201];

        cust[2] = [ChildCustomer new];
        [cust[2] setName:@"KIDO"];
        [cust[2] setAge:10];

        printCustomer(cust, 3);
        
        return (0);
        
} // main

