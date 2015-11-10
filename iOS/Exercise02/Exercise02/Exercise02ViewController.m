//
//  Exercise02ViewController.m
//  Exercise02
//
//  Created by Ochim on 13/01/24.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Exercise02ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation Exercise02ViewController
@synthesize satge;

//音声出力用の ID
SystemSoundID soundID;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //音声ファイルの読込み
    NSString *path = [[NSBundle mainBundle] pathForResource:@"action" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
}

- (void)viewDidUnload
{
    [self setSatge:nil];
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
    //通常の回転位置しか対応させない
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [satge release];
    //音声出力用の ID の解放
    AudioServicesDisposeSystemSoundID(soundID);
    [super dealloc];
}

- (IBAction)rock:(id)sender {
    satge.image = [UIImage imageNamed:@"gu.jpg"];
    [self playSound];
}

- (IBAction)scissors:(id)sender {
    satge.image = [UIImage imageNamed:@"choki.jpg"];
    [self playSound];
}

- (IBAction)paper:(id)sender {
    satge.image = [UIImage imageNamed:@"pa.jpg"];
    [self playSound];
}

- (void)playSound {
    //音声ファイルの読込み
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"action" ofType:@"wav"];
    //NSURL *url = [NSURL fileURLWithPath:path];
    //AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
    //音声の出力
    AudioServicesPlaySystemSound(soundID);
    
}

@end
