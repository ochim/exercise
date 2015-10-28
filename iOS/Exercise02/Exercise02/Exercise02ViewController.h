//
//  Exercise02ViewController.h
//  Exercise02
//
//  Created by Ochim on 13/01/24.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise02ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *satge;
- (IBAction)rock:(id)sender;
- (IBAction)scissors:(id)sender;
- (IBAction)paper:(id)sender;
- (void)playSound;

@end
