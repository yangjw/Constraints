//
//  NextVC.h
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-27.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishBack)(NSString *name);

@interface NextVC : UIViewController


@property(nonatomic,strong)FinishBack finshBack;
@end
