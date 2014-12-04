//
//  ViewController.m
//  SampleNotificationOfDate
//
//  Created by Eriko Ichinohe on 2014/12/03.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UserDefaultから保存されたデータを取得
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //日数（文字列）
    NSString *countdownDayNumber = [defaults objectForKey:@"countdownDayNumber"];
    
    //設定した日付（文字列）
    NSString *settingDate = [defaults objectForKey:@"settingDate"];

    if (countdownDayNumber != nil) {
        self.countdownLabel.text = [NSString stringWithFormat:@"あと%@日です",countdownDayNumber];
    }
    
    if (settingDate != nil) {
        self.settingDateLabel.text = [NSString stringWithFormat:@"%@までのカウントダウン",settingDate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapStart:(id)sender {
    
    // アプリに登録されている全ての通知を削除
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //現在日付
    NSDate *now = [NSDate date];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    [comp setDay:1];
    
    // 本日から1日分動かした日付（明日）を取得する。
    NSDate *future = self.settingDatePicker.date;
    
    // 現在から指定した日付との差分を、日を基準にして取得する。
    NSDateComponents *def1 = [cal components:NSDayCalendarUnit fromDate:now toDate:future options:0];
    NSLog(@"days: %d", [def1 day]);
    
    int countdownDayNumber = [def1 day];
    
    
    self.countdownLabel.text = [NSString stringWithFormat:@"あと%d日です",countdownDayNumber];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    //日時データを文字列に変換する場合のフォーマットを指定
    df.dateFormat = @"yyyy/MM/dd";
    
    
    self.settingDateLabel.text = [NSString stringWithFormat:@"%@までのカウントダウン",[df stringFromDate:self.settingDatePicker.date]];
    
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    //0:00:00に通知が来るように設定
    
    // NSDateFormatter を用意します。
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    // 変換用の書式を設定
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    
    
    // NSString を NSDate に変換
    NSDate* date_converted = [cal dateByAddingComponents:comp toDate:now options:0];
    
    //時間単位の文字列にセット
    NSString *hourDateString = [NSString stringWithFormat:@"%@ 00:00:00", [df stringFromDate:date_converted]];
    
    
    date_converted = [formatter dateFromString:hourDateString];

    //設定した日数と、カウントダウンする日付をUserDefaultに設定
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //日数
    [defaults setObject:[NSString stringWithFormat:@"%d",countdownDayNumber] forKey:@"countdownDayNumber"];
    
    //設定した日付
    [defaults setObject:[df stringFromDate:self.settingDatePicker.date] forKey:@"settingDate"];
    
    [defaults synchronize];

    
    //-------- localNotificationの設定 --------
    localNotification.fireDate = date_converted;
    
    localNotification.alertBody = [NSString stringWithFormat:@"あと%d日です",countdownDayNumber];
    

    localNotification.repeatInterval = NSDayCalendarUnit;
    //localNotification.repeatInterval = NSMinuteCalendarUnit;
    
    localNotification.applicationIconBadgeNumber = countdownDayNumber;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    //-------- localNotification End --------
    
    
    
    
}


@end
