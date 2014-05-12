//
//  MOTapLabel.h
//  ConstraintsVC
//
//  Created by yangjw  on 14-4-23.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOTapLabel : UILabel


@property (nonatomic, copy) void (^tapBlock)(NSInteger indexTapped);

- (void)setAttributedText:(NSAttributedString *)attributedText withSize:(CGSize)size;

@end