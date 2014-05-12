//
//  CustomPush.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-28.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "CustomPush.h"

@implementation CustomPush

//- (void)perform
//{
//	UIViewController *current = self.sourceViewController;
//	UIViewController *next  = self.destinationViewController;
////	[current.navigationController pushViewController:next animated:YES];
//	
//	
//	
//	[UIView transitionWithView:current.navigationController.view duration:0.2
//                       options:UIViewAnimationOptionTransitionFlipFromLeft
//                    animations:^{
//                        [current.navigationController pushViewController:next animated:NO];
//					}
//                    completion:NULL];
//}

-(void)perform{
	UIViewController *dst = [self destinationViewController];
	UIViewController *src = [self sourceViewController];
	[dst viewWillAppear:NO];
	[dst viewDidAppear:NO];
	
	
	[src.view addSubview:dst.view];
	
	CGRect original = dst.view.frame;
	
	dst.view.frame = CGRectMake(dst.view.frame.origin.x, 0-dst.view.frame.size.height, dst.view.frame.size.width, dst.view.frame.size.height);
	
	[UIView beginAnimations:nil context:nil];
	dst.view.frame = CGRectMake(original.origin.x, original.origin.y, original.size.height, original.size.width);
	[UIView commitAnimations];
	
	[self performSelector:@selector(animationDone:) withObject:dst afterDelay:0.2f];
}
- (void)animationDone:(id)vc{
	UIViewController *dst = (UIViewController*)vc;
	UINavigationController *nav = [[self sourceViewController] navigationController];
	[nav popViewControllerAnimated:NO];
	[nav pushViewController:dst animated:NO];
	[self sourceViewController];
}

@end
