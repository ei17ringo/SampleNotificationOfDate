//
//  AppDelegate.m
//  SampleNotificationOfDate
//
//  Created by Eriko Ichinohe on 2014/12/03.
//  Copyright (c) 2014年 Eriko Ichinohe. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    float osVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (osVersion >= 8.0f) {
        UIUserNotificationType types =  UIUserNotificationTypeBadge|
        UIUserNotificationTypeSound|
        UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        [application registerUserNotificationSettings:mySettings];
        

    }
 
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    
//    NSDate *now = [NSDate date];
//    
//    // 通知領域から消す
//    //[[UIApplication sharedApplication] cancelLocalNotification:notification];
//    
//    notification.fireDate = now;
//    
//    notification.alertBody = [NSString stringWithFormat:@"あと%d日です",2];
//    
//    
//    //localNotification.repeatInterval = NSDayCalendarUnit;
//    notification.repeatInterval = NSMinuteCalendarUnit;
//    
//    notification.applicationIconBadgeNumber = 2;
//    
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler{

//NSDate *now = [NSDate date];
//
//// 通知領域から消す
//[[UIApplication sharedApplication] cancelLocalNotification:notification];
//
//notification.fireDate = now;
//
//notification.alertBody = [NSString stringWithFormat:@"あと%d日です",2];
//
//
////localNotification.repeatInterval = NSDayCalendarUnit;
//notification.repeatInterval = NSMinuteCalendarUnit;
//
//notification.applicationIconBadgeNumber = 2;
//
//notification.timeZone = [NSTimeZone defaultTimeZone];
//
//[[UIApplication sharedApplication] scheduleLocalNotification:notification];


}

@end
