//
//  iPadViewController.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-28.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "iPadViewController.h"
#define kUrl @"http://f.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f725f31d1b700e0cf3d7cad61f.jpg"

#import "Draw.h"

@interface iPadViewController ()
{
	
}
@property (strong, nonatomic) IBOutlet Draw *drawView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@end

@implementation iPadViewController

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
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:kUrl];
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	[queue addOperation:operation];
	
	
	
//	[queue cancelAllOperations];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSURL * url = [NSURL URLWithString:kUrl];
		NSData * data = [[NSData alloc]initWithContentsOfURL:url];
		UIImage *image = [[UIImage alloc]initWithData:data];
		if (data != nil) {
			dispatch_async(dispatch_get_main_queue(), ^{
				self.imageView1.image = image;
				self.imageView1.contentMode =UIViewContentModeScaleAspectFill;
			});
		}
	});
	dispatch_queue_t disqueue = dispatch_queue_create("com.ipad.queue", 0);
	
	dispatch_async(disqueue, ^{
		
		
		dispatch_async(dispatch_get_main_queue(), ^{
			
		});
	});
	[_drawView setPercent:80 animated:YES];
}

-(void)downloadImage:(NSString *)url{
    NSLog(@"url:%@", url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
}
-(void)updateUI:(UIImage*) image{
    self.imageView.image = image;
	self.imageView.contentMode =UIViewContentModeScaleAspectFit;
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
