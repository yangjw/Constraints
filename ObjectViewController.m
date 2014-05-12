//
//  ObjectViewController.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-31.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "ObjectViewController.h"

@interface ObjectViewController ()
{
	
	IBOutlet UIView *centerView;
}
@end

@implementation ObjectViewController

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
	
	myLabel = [[MyClass alloc] initWithFrame:CGRectMake(0, 200, 100, 40)];
//	myLabel.backgroundColor = [UIColor blackColor];
	myLabel.text = @"custom my class";
	[self.view addSubview:myLabel];
	
	
	UIView *colorImage = [[UIView alloc] init];
	colorImage.backgroundColor = [UIColor blueColor];
	[self.view addSubview:colorImage];
	colorImage.translatesAutoresizingMaskIntoConstraints = NO;
	UIButton *mybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[mybutton setTitle:@"My Button" forState:UIControlStateNormal];

	[self.view addSubview:mybutton];
	mybutton.translatesAutoresizingMaskIntoConstraints = NO;
	NSDictionary *dic = NSDictionaryOfVariableBindings(mybutton,colorImage);
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(100)-[mybutton(40)]-64-[colorImage(100)]" options:NSLayoutFormatAlignAllRight metrics:nil views:dic]];
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[mybutton]" options:NSLayoutFormatAlignAllRight metrics:nil views:dic]];
	
//	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[colorImage(100)]" options:NSLayoutFormatAlignAllTop metrics:nil views:dic]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-64-[colorImage(100)]" options:NSLayoutFormatAlignAllTop metrics:nil views:dic]];
	
	
//	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:colorImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationLessThanOrEqual toItem:mybutton attribute:NSLayoutAttributeRight multiplier:1.0 constant:50]];
	
//	UIView *contentView = [[UIView alloc] init];
//    contentView.backgroundColor = [UIColor greenColor];
//    self.view = contentView;
	
//    UIView *centerView = [[UIView alloc] init];
//    [centerView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    centerView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:centerView];
//	
//    // Width constraint, half of parent view width
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
//                                                          attribute:NSLayoutAttributeWidth
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeWidth
//                                                         multiplier:0.5
//                                                           constant:0]];
//	
//    // Height constraint, half of parent view height
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:0.5
//                                                           constant:0]];
//	
//    // Center horizontally
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//	
//    // Center vertically
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
//                                                          attribute:NSLayoutAttributeCenterY
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterY
//                                                         multiplier:1.0
//                                                           constant:0.0]];

	
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
