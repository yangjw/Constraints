//
//  NSString+extended.h
//  ConstraintsVC
//
//  Created by yangjw  on 14-4-21.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (extended)
//计算文本的size
-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;
//sting转AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing;
@end
