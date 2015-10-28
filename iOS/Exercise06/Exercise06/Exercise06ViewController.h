//
//  Exercise06ViewController.h
//  Exercise06
//
//  Created by Ochim on 13/01/31.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface Exercise06ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *lblSoundPoint;
@property (retain, nonatomic) IBOutlet UIImageView *imgStage;
- (IBAction)clear:(id)sender;
- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)restart:(id)sender;

-(void)drawStage;
-(void)playMusic:(NSTimer *)myTimer;
-(void)playSound:(NSInteger)num;

@end
