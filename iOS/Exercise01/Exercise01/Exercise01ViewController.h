//
//  Exercise01ViewController.h
//  Exercise01
//
//  Created by Ochim on 13/01/17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise01ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *txtCharge;
@property (retain, nonatomic) IBOutlet UITextField *txtNumber;
@property (retain, nonatomic) IBOutlet UILabel *lblPerPerson;
@property (retain, nonatomic) IBOutlet UILabel *lblFraction;
- (IBAction)calculate:(id)sender;

@end
