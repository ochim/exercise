//
//  Exercise05ViewController.m
//  Exercise05
//
//  Created by ケンソフト on 12/03/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Exercise05ViewController.h"

@implementation Exercise05ViewController
@synthesize imgStage;
@synthesize imgEnemy;
@synthesize lblResult;

typedef enum {
    GU = 0,
    CHOKI,
    PA
} Janken;

//音声出力用のID
SystemSoundID soundID;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [self setImgStage:nil];
    [self setImgEnemy:nil];
    [self setLblResult:nil];
    [super viewDidUnload];

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
    [imgStage release];
    //音声出力用のIDの解放
    [imgEnemy release];
    [lblResult release];
    AudioServicesDisposeSystemSoundID(soundID);
    [super dealloc];
}

- (Janken)selectEnemyImg {
    int choice = arc4random() % 3;
    Janken janken;
    switch (choice) {
        case 0:
            imgEnemy.image = [UIImage imageNamed:@"gu.jpg"];
            janken = GU;
            break;
        case 1:
            imgEnemy.image = [UIImage imageNamed:@"choki.jpg"];
            janken = CHOKI;
            break;
        case 2:
            imgEnemy.image = [UIImage imageNamed:@"pa.jpg"];
            janken = PA;
            break;
        default:
            break;
    }
    imgEnemy.transform = CGAffineTransformMakeRotation(M_PI);
    return janken;
}

- (void)decideLblResult:(Janken)myChoice enemy:(Janken)enemyChoice {
    if (myChoice == enemyChoice) {
        lblResult.text = @"引き分け";
        return;
    }
    if (myChoice == GU) {
        if (enemyChoice == CHOKI) {
            lblResult.text = @"勝ち";
        } else {
            lblResult.text = @"負け";
        }
        return;
    }
    
    if (myChoice == CHOKI) {
        if (enemyChoice == PA) {
            lblResult.text = @"勝ち";
        } else {
            lblResult.text = @"負け";
        }
        return;
    }
    
    if (myChoice == PA) {
        if (enemyChoice == GU) {
            lblResult.text = @"勝ち";
        } else {
            lblResult.text = @"負け";
        }
        return;
    }
}

//グーボタンのアクションメソッド
- (IBAction)rock:(id)sender {
    imgStage.image = [UIImage imageNamed:@"gu.jpg"];
    [self playSound];
    Janken enemy = [self selectEnemyImg];
    [self decideLblResult:GU enemy:enemy];
}

//チョキボタンのアクションメソッド
- (IBAction)scissors:(id)sender {
    imgStage.image = [UIImage imageNamed:@"choki.jpg"];
    [self playSound];
    Janken enemy = [self selectEnemyImg];
    [self decideLblResult:CHOKI enemy:enemy];
}

//パーボタンのアクションメソッド
- (IBAction)paper:(id)sender {
    imgStage.image = [UIImage imageNamed:@"pa.jpg"];
    [self playSound];
    Janken enemy = [self selectEnemyImg];
    [self decideLblResult:PA enemy:enemy];
}

//音声を出力するメソッド
-(void)playSound{
    
    //音声ファイルの読込み
    NSString *path = [[NSBundle mainBundle] pathForResource:@"action" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //音声の出力
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
	AudioServicesPlaySystemSound(soundID);
}

@end
