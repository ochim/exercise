//
//  Exercise05ViewController.h
//  Exercise05
//
//  Created by ケンソフト on 12/03/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface Exercise05ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIImageView *imgStage;
@property (retain, nonatomic) IBOutlet UIImageView *imgEnemy;
@property (retain, nonatomic) IBOutlet UILabel *lblResult;
- (IBAction)rock:(id)sender;
- (IBAction)scissors:(id)sender;
- (IBAction)paper:(id)sender;
-(void)playSound;
@end
