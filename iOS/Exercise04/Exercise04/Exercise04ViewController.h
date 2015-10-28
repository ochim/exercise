//
//  Exercise04ViewController.h
//  Exercise04
//
//  Created by Ochim on 13/01/31.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface Exercise04ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *imgNote;
- (IBAction)touchKey:(id)sender;

-(void)playSound:(NSInteger)num;
@end
