//
//  MMTextAttachment.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-5-13.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "MMTextAttachment.h"

@implementation MMTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{

	return CGRectMake(0, 0, lineFrag.size.height, lineFrag.size.width);
}

@end
