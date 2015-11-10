//
//  Exercise06ViewController.m
//  Exercise06
//
//  Created by Ochim on 13/01/31.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Exercise06ViewController.h"

@implementation Exercise06ViewController
@synthesize lblSoundPoint;
@synthesize imgStage;

#define LINE_HEIGHT 32          //音符の配置ラインの高さ(音符画像の横幅）
#define TIMER_INTERVAL 0.02f     //タイマーの実行間隔

NSMutableArray *soundPoints;
NSTimer *timer;
NSArray *soundURLs;
SystemSoundID soundID;
NSInteger soundCounter;

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
    soundPoints = [[NSMutableArray array] retain];
    
    NSBundle *bundle = [NSBundle mainBundle];
    soundURLs = [[NSArray arrayWithObjects:
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_do2" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_si" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_ra" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_so" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_fa" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_mi" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_re" ofType:@"wav"]],
                 [NSURL fileURLWithPath:[bundle pathForResource:@"piano_do" ofType:@"wav"]],
                 nil] retain];

    soundCounter = 0;

    NSURL *url = [NSURL fileURLWithPath:[bundle pathForResource:@"opening" ofType:@"wav"]];
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
	AudioServicesPlaySystemSound(soundID);
}

- (void)viewDidUnload
{
    [self setLblSoundPoint:nil];
    [self setImgStage:nil];
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
    if (timer) {
        [timer invalidate];
        timer = nil; 
    }
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)dealloc {
    [lblSoundPoint release];
    [imgStage release];
    [soundPoints release];
    [soundURLs release];
    AudioServicesDisposeSystemSoundID(soundID);
    [super dealloc];
}

//画面のタッチの開始で呼ばれる
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //タッチ時の情報が引数にオブジェクトとして設定されているので、そこからタッチ位置を特定
	CGPoint tmpPoint = [[touches anyObject] locationInView:self.imgStage];
    
    //タッチした縦座標をイメージの縦幅（256）の８等分の枠に当てはまるように補正
    tmpPoint.y= floor(tmpPoint.y /LINE_HEIGHT ) * LINE_HEIGHT;
    
    //位置情報を配列に格納
    NSValue *val = [NSValue valueWithCGPoint:tmpPoint];
	[soundPoints addObject:val];
    
    //画像の表示
    [self drawStage];
}

- (IBAction)clear:(id)sender {
    //ストップする。
    [self stop:sender];
    
    //音声出力カウンターを開始位置に移動
    soundCounter = 0;
    
    //音符位置情報の全削除
    [soundPoints removeAllObjects];
    
    //画像の表示
    [self drawStage];
}

- (IBAction)play:(id)sender {
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL target:self selector:@selector(playMusic:) userInfo:nil repeats:YES]; 
    }
}

- (IBAction)stop:(id)sender {
    if (timer) {
        [timer invalidate];
        timer = nil; 
    }
}

- (IBAction)restart:(id)sender {

    [self stop:sender];
    soundCounter = 0;
    [self play:sender];
}

//画像の描画
-(void)drawStage{
    //仮想描画エリアへの描画開始
	UIGraphicsBeginImageContext(self.imgStage.bounds.size);
    
    //音符位置情報の配列を順次参照
    for(int i =0 ; i < [soundPoints count]; i++){
        
        //配列から音符の位置情報を取得
        NSValue *val = [soundPoints objectAtIndex:i];
        CGPoint pt;
        [val getValue:&pt];
        
        //取得した位置に音符画像を描画
        UIImage *img = [UIImage imageNamed:@"maru.png"];
        CGRect rectChatcher = CGRectMake(pt.x, pt.y, LINE_HEIGHT, LINE_HEIGHT);
        [img drawInRect:rectChatcher];
    }
    
	//仮想描画エリアの画像をImageインスタンスに格納
	UIImage *newImage;
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext(); 
    imgStage.image = newImage;
    
}


//音楽再生、タイマーからの呼び出しメソッド
-(void)playMusic:(NSTimer *)myTimer{
    
    //音声出力カウンターをインクリメント
    soundCounter++  ;
    
    //音符位置情報の配列を順次参照
    for(int i =0 ; i < [soundPoints count]  ;i++){
        
        //配列から音符の位置情報を取得
        NSValue *val = [soundPoints objectAtIndex:i];
        CGPoint pt;
        [val getValue:&pt];
        
        //音符の位置情報から音階を算出して音声出力
        if (floor(pt.x) == soundCounter) {
            NSInteger soundNum = floor(pt.y / LINE_HEIGHT);
            [self playSound:soundNum];
            
        }
    } 
    
    //再生の対象のバーを移動
    lblSoundPoint.center = CGPointMake(soundCounter, lblSoundPoint.center.y);
    
    //音声出力カウンターの位置が、画面でユーザが設定できる位置を超えたら停止
    //画面横幅一杯まで
    if (soundCounter >= imgStage.bounds.size.width){
        [timer invalidate];
        timer = nil;
        soundCounter = 0;
    }
}

//音声を出力するメソッド
-(void)playSound:(NSInteger)num{
    
    //配列から該当の音声ファイルのURLを取得して音声出力
    NSURL *url = [soundURLs objectAtIndex:num];
    
    //音声の出力
    AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
	AudioServicesPlaySystemSound(soundID);
}

@end
