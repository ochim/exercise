//
//  Exercise04ViewController.m
//  Exercise04
//
//  Created by Ochim on 13/01/31.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Exercise04ViewController.h"

@implementation Exercise04ViewController
@synthesize imgNote;
//音声出力用のID
SystemSoundID soundID;
//音声ふぁいるURLの配列
NSArray *aryURLSound ;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //音声ファイルのURLを配列に格納
    NSBundle* bundle = [NSBundle mainBundle];
    aryURLSound = [[NSArray arrayWithObjects:
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_do" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_re" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_mi" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_fa" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_so" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_ra" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_si" ofType:@"wav"]],
                    [NSURL fileURLWithPath:[bundle pathForResource:@"piano_do2" ofType:@"wav"]],
                    nil] retain];
    
    //音符の画像を透明する。
    imgNote.alpha = 0;
    
}

- (void)viewDidUnload
{
    [self setImgNote:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)dealloc {
    [imgNote release];
    [aryURLSound release];
    AudioServicesDisposeSystemSoundID(soundID);
    [super dealloc];
}

- (IBAction)touchKey:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    //音声の出力
    [self playSound:btn.tag];
    
    //音符の表示位置を算出
    CGPoint ptNote = btn.center;
    NSInteger upLength = 10 * btn.tag;
    ptNote.y = ptNote.y -100 -upLength ;
    imgNote.center =ptNote;
    
    //音符のアニメーションを設定
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.5];
    imgNote.alpha = 1.0;
    imgNote.alpha = 0.0;
    [UIView commitAnimations];
}

//音声を出力するメソッド
-(void)playSound:(NSInteger)num{
    
    //配列から該当の音声ファイルのURLを取得して音声出力
    NSURL *url = [aryURLSound objectAtIndex:num];
    
    //音声の出力
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
	AudioServicesPlaySystemSound(soundID);
}

@end
