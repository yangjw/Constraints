//
//  ClickLabel.h
//  ConstraintsVC
//
//  Created by yangjw  on 14-5-6.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClickLabel : UILabel
@property (nonatomic, copy) void (^tapBlock)(NSInteger indexTapped);

- (void)setAttributedText:(NSAttributedString *)attributedText withSize:(CGSize)size;

@end