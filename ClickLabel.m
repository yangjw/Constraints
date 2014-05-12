//
//  ClickLabel.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-5-6.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "ClickLabel.h"
#import <CoreText/CoreText.h>

@interface ClickLabel()
{
	CTFrameRef _frame;
}

@end

@implementation ClickLabel


- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		self.numberOfLines          = 0;
		// Add tap gesture to view
	}
	return self;
}

- (void)setAttributedText:(NSAttributedString *)attributedText withSize:(CGSize)size
{
	self.userInteractionEnabled = YES;
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
	tapGesture.cancelsTouchesInView    = NO;
	
	[self addGestureRecognizer:tapGesture];
	// Set attributed text
	self.attributedText = attributedText;
	//	self.size = size;
	// The following properties will be used to discover what
	// character was tapped what a tap occurs
	
	// Creat container
	//	self.textContainer = [[NSTextContainer alloc] initWithSize:size];
	//
	//	// Create layout manager
	//	self.layoutManager = [[NSLayoutManager alloc] init];
	//	[self.layoutManager addTextContainer:self.textContainer];
	//
	//	// Create text storages
	//	self.textStorage = [[NSTextStorage alloc] init];
	//	[self.textStorage appendAttributedString:self.attributedText];
	//
	//	[self.textStorage addLayoutManager:self.layoutManager];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture
{
	//	CGPoint point = [tapGesture locationInView:self];
	//
	//	// Discover what the index of the tapped charact is
	//	NSUInteger glyphIndex          = [self.layoutManager glyphIndexForPoint:point inTextContainer:self.textContainer];
	//	NSInteger tappedCharacterIndex = [self.layoutManager characterIndexForGlyphAtIndex:glyphIndex];
	//
	//	// Return tap block with index
	//	_tapBlock(tappedCharacterIndex);
	CGPoint point = [tapGesture locationInView:self];
	//创建CTFrame,attString为NSMutableAttributedString
    CGMutablePathRef mainPath = CGPathCreateMutable();
	CGPathAddRect(mainPath, NULL, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    CTFrameRef ctframe = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), mainPath, NULL);
	//    CGPathRelease(mainPath);
	
    //取文字行数
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(ctframe);
    NSInteger lineCount = [lines count];
    CGPoint origins[lineCount];
    
    //判断有文字
    if (lineCount != 0) {
        //每行起始位置
        CTFrameGetLineOrigins(ctframe, CFRangeMake(0, 0), origins);
        
        //每行
        for (int i = 0; i < lineCount; i++) {
            //一行起始坐标
            CGPoint baselineOrigin = origins[i];
            
            //取真正起始y
          	baselineOrigin.y = CGRectGetHeight(self.frame) - baselineOrigin.y;
			
			CTLineRef line = (__bridge CTLineRef)[lines objectAtIndex:i];
			CGFloat ascent, descent;
            //取行高,行宽
			CGFloat lineWidth = CTLineGetTypographicBounds(line, &ascent, &descent, NULL);
			//取一行真正面积
			CGRect lineFrame = CGRectMake(baselineOrigin.x, baselineOrigin.y - ascent, lineWidth, ascent + descent);
            //判断点击在不在范围内
            if (CGRectContainsPoint(lineFrame, point)) {
                
                //取被点击字符位置
                CFIndex index = CTLineGetStringIndexForPosition(line, point);
				//取所有可以点击的字符range
				//								NSArray *urlsKeys = [dic allKeys];
				//								//遍历
				//								for (NSString *key in urlsKeys) {
				//				                //判断,如果点击在range内则执行
				//									NSRange range = NSRangeFromString(key);
				//									if (index >= range.location && index < range.location + range.length) {
				//										//通过Key取值,要点击的值
				//										//做动作
				//										break;
				//									}
				//								}
				//				NSLog(@"=======%ld",index);
				_tapBlock(index);
            }
        }
    }
	
}

@end
