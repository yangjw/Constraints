//
//  NewQuestionVC.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-5-14.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "NewQuestionVC.h"

typedef NS_ENUM(NSInteger, QuestionAnswer)
{
	QuestionAnswerDefautl,	//默认选择
	QuestionAnswerA,			// A
	QuestionAnswerB,			// B
	QuestionAnswerC,			// C
	QuestionAnswerD			// D
};


@interface NewQuestionVC ()<UIScrollViewDelegate>
{
	
	IBOutlet UIScrollView *newScrollView;
	IBOutlet UILabel *texttitle;
	IBOutlet UILabel *aText;
	IBOutlet UILabel *bText;
	IBOutlet UILabel *cText;
	IBOutlet UILabel *dText;
	
	IBOutlet UIButton *aButton;
	IBOutlet UIButton *bButton;
	IBOutlet UIButton *cButton;
	IBOutlet UIButton *dButton;
}

@property(nonatomic,assign)QuestionAnswer *answer;
@end

@implementation NewQuestionVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.edgesForExtendedLayout = UIRectEdgeNone;
//	[newScrollView setContentSize:CGSizeMake(320, 1000)];
	
	texttitle.text = @"非常经典的飞行射击类游戏飞离神庙a教程网分享过欢android游戏开发的朋友可以下载吧。";
	aText.text = @"非常经典的飞行射击类游戏飞离神庙and不多，喜欢android游戏开发的朋友可以下载吧。";
	bText.text = @"非常玩法简单，跟我们平时生活中玩的一下射击类的游戏玩法差不多，喜欢android游戏开发的朋友可以下载吧。";
	cText.text = @"非常经典戏开发的朋友可以下载吧。";
	dText.text = @"源码是从安卓教程网分享过来的，该游戏";
//		[aButton addTarget:self action:@selector(chooseAnswer:) forControlEvents:UIControlEventTouchUpInside];
//
//		[bButton addTarget:self action:@selector(chooseAnswerB:) forControlEvents:UIControlEventTouchUpInside];
//
//		[cButton addTarget:self action:@selector(chooseAnswerC:) forControlEvents:UIControlEventTouchUpInside];
//
//		[dButton addTarget:self action:@selector(chooseAnswerD:) forControlEvents:UIControlEventTouchUpInside];
}


- (IBAction)chooseAnswer:(id)button
{
		NSLog(@"...aButton....");

}

- (IBAction)chooseAnswerB:(id)button
{
	
		NSLog(@"...bButton....");
	
}

- (IBAction)chooseAnswerC:(id)button
{

		NSLog(@"...cButton....");

}

- (IBAction)chooseAnswerD:(id)button
{

		NSLog(@"...dButton....");
}


- (void)viewDidLayoutSubviews
{
	
	NSLog(@"********%f",newScrollView.contentSize.height);
	[newScrollView setContentSize:CGSizeMake(320, 1200)];

	[self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
	
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
