//
//  AppDelegate.h
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-26.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CompletionHandler)(UIBackgroundFetchResult);


@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>
{
	NSMutableDictionary *notifiDic;
}



@property (strong, nonatomic) UIWindow *window;
//+ (instancetype)sharedDelegate;


@property (copy, nonatomic) CompletionHandler completionHandler;
@end
