//
//  Exercise03ViewController.h
//  Exercise03
//
//  Created by Ochim on 13/01/29.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exercise03ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (retain, nonatomic) IBOutlet UIPickerView *picker;
@property (retain, nonatomic) IBOutlet UILabel *lblResult;
- (IBAction)calculate:(id)sender;

- (IBAction)save:(id)sender;
- (IBAction)read:(id)sender;
@end
