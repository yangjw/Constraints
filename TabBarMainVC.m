//
//  TabBarMainVC.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-4-22.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "TabBarMainVC.h"

@interface TabBarMainVC ()
{
	IBOutlet UIView *contentView;
	IBOutlet UIView *oneView;
	IBOutlet UIView *twoView;
	IBOutlet UIView *threeView;
}
@end

@implementation TabBarMainVC

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
    // Do any additional setup after loading the view.
	
	NSLog(@"%f*******%f*****",contentView.frame.origin.y,contentView.frame.size.height);
	[contentView addSubview:oneView];
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
