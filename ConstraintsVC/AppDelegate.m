//
//  AppDelegate.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-26.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
	notifiDic = [[NSMutableDictionary alloc] init];
    
    [self initNotification];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    
    NSLog(@"launchOption==%@",[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]);
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey] != nil) {
        
        if (notifiDic.count != 0) {
            [notifiDic removeAllObjects];
        }
        [notifiDic setDictionary:(NSDictionary *)[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"didFinishLaunching" message:[NSString stringWithFormat:@"didFinishLaunching：\n%@",launchOptions] delegate:self cancelButtonTitle:@"Cancek" otherButtonTitles:@"OK", nil];
        [alert show];
        alert.tag = 101;

    }
	
	
    // Override point for customization after application launch.
	
	/*
	 UIApplicationBackgroundFetchIntervalMinimum表示系统应该尽可能经常去管理程序什么时候被唤醒并执行fetch任务，
	 UIApplicationBackgroundFetchIntervalNever那么我们的程序将永远不能在后台获取程序，当然如果我们的程序完成某个任务并且不再需要后台加载数据时应该使用该值关闭Background Fetch功能。
	 */
	
//	[[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
	
//	if ([[UIApplication sharedApplication] backgroundRefreshStatus] != UIBackgroundRefreshStatusAvailable)
//	{
//		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"您没有开启后台刷新，请在 设置->通用->应用程序后台刷新 中开启." delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//		[alertView show];
//	}
//	
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
}

//- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
//{
//	/*
//	 UIBackgroundFetchResultNewData 成功拉取数据
//	 UIBackgroundFetchResultNoData 没有新数据
//	 UIBackgroundFetchResultFailed 拉取数据失败或者超时
//	 */
//	completionHandler(UIBackgroundFetchResultNewData);
//	
//	NSLog(@"Application Delegate: Perform Fetch");
//
//    application.applicationIconBadgeNumber += 1;
//	
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)initNotification{
    [[UIApplication sharedApplication]registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound)];
}
#pragma mark -
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"deviceToken: %@", deviceToken);
    NSLog(@"deviceToken===%@",[deviceToken description]);
    
    NSRange _range = NSMakeRange(1,[[deviceToken description] length]-2);
    NSString *deviceTokenStr = [[deviceToken description] substringWithRange:_range];
    NSLog(@"deviceTokenStr==%@",deviceTokenStr);
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"deviceTokenStr==%@",deviceTokenStr);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"product deviceToken" message:deviceTokenStr delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
    NSLog(@"%s,,,,%@",__func__,userInfo);

    if (notifiDic.count != 0) {
        [notifiDic removeAllObjects];
    }
    [notifiDic setDictionary:userInfo];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"受到的通知如下：\n%@",userInfo] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
    alert.tag = 100;
    
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"%s",__func__);
}

@end
