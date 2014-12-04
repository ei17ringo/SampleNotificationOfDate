//
//  ViewController.h
//  SampleNotificationOfDate
//
//  Created by Eriko Ichinohe on 2014/12/03.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *startButton;
- (IBAction)tapStart:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *settingDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *settingDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

@end

