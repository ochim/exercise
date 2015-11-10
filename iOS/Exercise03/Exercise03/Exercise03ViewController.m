//
//  Exercise03ViewController.m
//  Exercise03
//
//  Created by Ochim on 13/01/29.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Exercise03ViewController.h"

@implementation Exercise03ViewController
@synthesize picker;
@synthesize lblResult;

//ピッカービューへの表示項目用の配列の宣言
NSArray *arySex;
NSMutableArray *aryAge;
NSMutableArray *aryHeight;
NSMutableArray *aryWeight;

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
    arySex = [[NSArray arrayWithObjects:@"男性", @"女性", nil] retain];
    aryAge = [[NSMutableArray array] retain];
    for (int i=20; i<70; i++) {
        [aryAge addObject:[NSNumber numberWithInt:i]];
    }
    aryHeight = [[NSMutableArray array] retain];
    for (int i=130; i<200; i++) {
        [aryHeight addObject:[NSNumber numberWithInt:i]];
    }
    aryWeight = [[NSMutableArray array] retain];
    for (int i=40; i<120; i++) {
        [aryWeight addObject:[NSNumber numberWithInt:i]];
    }
}

- (void)viewDidUnload
{
    [self setPicker:nil];
    [self setLblResult:nil];
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
    [picker release];
    [lblResult release];
    [arySex release];
    [aryAge release];
    [aryHeight release];
    [aryWeight release];
    [super dealloc];
}

#pragma -

//ファイルパスを作成し戻す
-(NSString *)getFilePath{
    
    // アプリケーションが配置されているディレクトリの取得
    NSString *path = NSHomeDirectory();
    
    //ファイルパスの文字列を作成
    path = [[ path stringByAppendingString:@"/Documents"] 
            stringByAppendingString:@"/e03.txt"];
    return path;
}

- (IBAction)calculate:(id)sender {
    //ピッカービューで選択されている項目のインデックスかを取得
    NSInteger gender = [picker selectedRowInComponent:0];
    NSInteger age = [picker selectedRowInComponent:1];
    NSInteger height = [picker selectedRowInComponent:2];
    NSInteger weight = [picker selectedRowInComponent:3];
    NSInteger result;
    
    //インデックスが実際の値を算出
    age = [[aryAge objectAtIndex:age] integerValue];
    height = [[aryHeight objectAtIndex:height] integerValue];
    weight = [[aryWeight objectAtIndex:weight] integerValue];;
    
    
    if (gender == 0) {
        //男性の場合
        result = floor(66.47+(13.75*weight)+(5.0 *height)-(6.76*age));
    }else{
        //女性の場合
        result = floor(665.1+(9.65*weight)+(1.85 *height)-(4.68*age));
    }
    
    NSString *strResult = [NSString stringWithFormat:@"%d",result];
    lblResult.text = strResult;
}

//保存のアクションメソッド
- (IBAction)save:(id)sender {
    NSInteger gender = [picker selectedRowInComponent:0];
    NSInteger age = [picker selectedRowInComponent:1];
    NSInteger height = [picker selectedRowInComponent:2];
    NSInteger weight = [picker selectedRowInComponent:3];
    
    NSString *saveString =[NSString stringWithFormat:@"%d,%d,%d,%d",gender,age,height,weight];
    //ファイル名の取得
    NSString *path = [self getFilePath];
    
    //ファイルへの保存
    [saveString writeToFile:path
                 atomically:YES
                   encoding:NSUTF8StringEncoding
                      error:NULL];
}

//読込のアクションメソッド
- (IBAction)read:(id)sender {
    //ファイル名の取得
    NSString *path = [self getFilePath];
    
    //テキストファイルの読込み
    NSString *data=[NSString stringWithContentsOfFile:path
                                             encoding:NSUTF8StringEncoding
                                                error:NULL];
    //カンマ区切り文字列を配列に保存
    NSArray *ary = [data componentsSeparatedByString:@","]; 
    
    //配列の値を文字列変数に保存
    NSString *strGender = [ary objectAtIndex:0];
    NSString *strAge = [ary objectAtIndex:1];
    NSString *strHeight = [ary objectAtIndex:2];
    NSString *strWeight = [ary objectAtIndex:3];
    
    // ピッカービューの選択値に設定
    [picker selectRow:[strGender intValue] inComponent:0 animated:YES];
    [picker selectRow:[strAge intValue] inComponent:1 animated:YES];
    [picker selectRow:[strHeight intValue] inComponent:2 animated:YES];
    [picker selectRow:[strWeight intValue] inComponent:3 animated:YES];
    
}

#pragma -

//ピッカービューの列数（コンポーネント数）の設定
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 4;
}

//ピッカービューの行数の設定
-(NSInteger) pickerView:(UIPickerView*) view 
numberOfRowsInComponent:(NSInteger) comp
{
    //配列の要素数を行数とする。
    switch (comp) {
        case 0:
            return [arySex count]; 
            break;
        case 1:
            return [aryAge count]; 
            break;
        case 2:
            return [aryHeight count]; 
            break;
        case 3:
            return [aryWeight count]; 
            break;
        default:
            return 0;
            break;
    }
}

//ピッカービューの列幅の設定
-(CGFloat) pickerView:(UIPickerView *)pickerView 
    widthForComponent:(NSInteger) comp{
    switch (comp) {
        case 0:
            return 60; 
            break;
        case 1:
            return 60; 
            break;
        case 2:
            return 80; 
            break;
        case 3:
            return 80; 
            break;
        default:
            return 0;
            break;
    }
}

//ピッカービューの表示項目の設定
-(NSString *) pickerView:(UIPickerView *) view
             titleForRow:(NSInteger) row
            forComponent:(NSInteger) comp{
    switch (comp) {
        case 0:
            return [arySex objectAtIndex:row]; 
            break;
        case 1:
            return [NSString stringWithFormat:@"%@才", [aryAge objectAtIndex:row]]; 
            break;
        case 2:
            return [NSString stringWithFormat:@"%@cm", [aryHeight objectAtIndex:row]]; 
            break;
        case 3:
            return [NSString stringWithFormat:@"%@kg", [aryWeight objectAtIndex:row]]; 
            break;
            
        default:
            return 0;
            break;
    }
}

@end
