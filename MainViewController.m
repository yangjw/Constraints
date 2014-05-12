//
//  MainViewController.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-4-8.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "ConViewController.h"

@interface MainViewController ()
{
	
	IBOutlet UIView *contentView;
	UIViewController *currentViewController;
	
}
- (IBAction)onClickbutton:(id)sender;
- (IBAction)test:(id)sender;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)test:(id)sender
{
	ConViewController *con = [[NSClassFromString(@"ConViewController") alloc] init];
	[self.navigationController pushViewController:con animated:YES];
}

- (UIStoryboard *)mainStory
{
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
	return storyboard;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	FirstViewController *first = [[self mainStory] instantiateViewControllerWithIdentifier:@"First"];
	
	[self addChildViewController:first];
	TwoViewController *two = [[self mainStory] instantiateViewControllerWithIdentifier:@"Two"];
	[self addChildViewController:two];
	ThreeViewController *three = [[self mainStory] instantiateViewControllerWithIdentifier:@"Three"];
	[self addChildViewController:three];
	
	[contentView addSubview:three.view];
	currentViewController = three;
//	NSLog(@"***********************%@",self.childViewControllers);
	
	NSStringFromSelector(@selector(methodName));
		
}


- (void)methodName
{
		NSLog(@"***********************%@",self.childViewControllers);
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

- (IBAction)onClickbutton:(id)sender
{
	FirstViewController *firstViewController=[self.childViewControllers objectAtIndex:0];
	TwoViewController *secondViewController=[self.childViewControllers objectAtIndex:1];
	ThreeViewController *thirdViewController=[self.childViewControllers objectAtIndex:2];
	if ((currentViewController==firstViewController&&[sender tag]==1)	||
		(currentViewController==secondViewController&&[sender tag]==2)	||
		(currentViewController==thirdViewController&&[sender tag]==3))
	{
		return;
	}
	
	UIViewController *oldViewController=currentViewController;
	switch ([sender tag]) {
		case 1:
		{
			NSLog(@"1");
			[self transitionFromViewController:currentViewController toViewController:firstViewController duration:4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
			} completion:^(BOOL finished) {
				if (finished) {
					currentViewController=firstViewController;
				}else{
					currentViewController=oldViewController;
				}
			}];
		}
			break;
		case 2:
		{
			NSLog(@"2");
			[self transitionFromViewController:currentViewController toViewController:secondViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
				
			} completion:^(BOOL finished) {
				if (finished) {
					currentViewController=secondViewController;
				}else{
					currentViewController=oldViewController;
				}
			}];
		}
			break;
		case 3:
		{
			NSLog(@"3");
			[self transitionFromViewController:currentViewController toViewController:thirdViewController duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
				
			} completion:^(BOOL finished) {
				if (finished) {
					currentViewController=thirdViewController;
				}else{ 
					currentViewController=oldViewController; 
				} 
			}]; 
		} 
			break; 
		default: 
			break; 
	}
	
}


@end
