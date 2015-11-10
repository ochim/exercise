//
//  Exercise01ViewController.m
//  Exercise01
//
//  Created by Ochim on 13/01/17.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Exercise01ViewController.h"

@implementation Exercise01ViewController
@synthesize txtCharge;
@synthesize txtNumber;
@synthesize lblPerPerson;
@synthesize lblFraction;

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
}

- (void)viewDidUnload
{
    [self setTxtCharge:nil];
    [self setTxtNumber:nil];
    [self setLblPerPerson:nil];
    [self setLblFraction:nil];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [txtCharge release];
    [txtNumber release];
    [lblPerPerson release];
    [lblFraction release];
    [super dealloc];
}
- (IBAction)calculate:(id)sender {
    //TextField から文字列を取得
    NSString *strCharge = txtCharge.text;
    NSString *strNumber = txtNumber.text;
    //数値に変換
    NSInteger intCharge = [strCharge integerValue];
    NSInteger intNumber = [strNumber integerValue];
    
    //一人当たりの金額と端数を計算
    if (intNumber > 0) {
        NSInteger fltAmount = (int)(intCharge / intNumber);
        NSInteger intFraction = intCharge % intNumber;
        
        //書式を整えながら Label に表示
        lblPerPerson.text = [NSString stringWithFormat:@"%d", fltAmount ];
        lblFraction.text = [NSString stringWithFormat:@"%d", intFraction];
    } else {
        lblPerPerson.text = @"--";
        lblFraction.text = @"--";
    }
    
    //キーボードを非表示にする
    [self.txtCharge resignFirstResponder];
    [self.txtNumber resignFirstResponder];
    
}
@end
