//
//  ViewController.m
//  ConstraintsVC
//
//  Created by yangjw  on 14-3-26.
//  Copyright (c) 2014年 yangjw . All rights reserved.
//

#import "ViewController.h"
#import "NextVC.h"
#import "MOTapLabel.h"
#import "ClickLabel.h"
#import "MMTextAttachment.h"

#if __LP64__
#define D "ld"
#define U "lu"
#else
#define D "d"
#define U "u"
#endif

typedef void(^HelloSystem)(NSInteger number);
typedef NSDictionary *(^SetValue)(NSString *kayName);


typedef int (^Block1)(int(^)(int));
typedef int (^Block3)(int);


@interface ViewController ()
{
//	NextVC *next;
	BOOL go;
	BOOL back;
}
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) UITextView *text;
@property (strong, nonatomic) IBOutlet UIButton *testbutotn;
@property (strong, nonatomic) IBOutlet UIImageView *imageVeiw;

@property(nonatomic,assign)HelloSystem helloSystem;
@property(nonatomic,strong)SetValue  setvalue;

@property(nonatomic,strong)Block1 block1;
@property(nonatomic,strong)Block3 block3;
@property (strong, nonatomic) IBOutlet MOTapLabel *test;
@property (strong, nonatomic) IBOutlet ClickLabel *clickTest;

@end

@implementation ViewController

//int (^block3)(int)=^(int i){
//	return i*2;
//};
//
//
//-(int)block1:(Block1)block{
//	Block3 x;
//	return block(x);
//}


- (void)blockMethod:(Block3)testBlock
{
//	testBlock(2);
	NSLog(@"**********************************%d",testBlock(2));
}

- (void)objectMethod:(int(^)(int))sequeare
{
	sequeare(6);
}

- (void)method:(void(^)(NSString*))name
{
	name(@"name");
}

- (void)returnDic:(NSDictionary* (^)(NSString*))value
{
	NSDictionary *dic = value(@"hello");
	NSLog(@"===================%@",dic);
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	
	
	NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好" attributes:nil];
	MMTextAttachment *textAttacthmen = [[MMTextAttachment alloc] initWithData:nil ofType:nil];
	UIImage *image = [UIImage imageNamed:@"ttescon.png"];
	textAttacthmen.image = image;
	
	NSAttributedString *textAttibutedString = [NSAttributedString attributedStringWithAttachment:textAttacthmen];
	[mutableAttributedstring insertAttributedString:textAttibutedString atIndex:30];
	_textView.attributedText  = mutableAttributedstring;
	
	
	self.text = ({
		UITextView *txt = [[UITextView alloc] init];
		txt;
	});
	
	
	_testbutotn = ({
		[_testbutotn addTarget:self action:@selector(pupu_show) forControlEvents:UIControlEventTouchUpInside];
		_testbutotn;
	});
	
	
//	go = TRUE;
//	back = FALSE;
//	UIImage *i =[UIImage imageNamed:@"ttescon"];
//	UIImageView *pupu_img = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 80.0, i.size.width, i.size.height)];//執行設定好的動畫
//	pupu_img.image = [UIImage imageNamed:@"ttestcon.png"];
//	pupu_img.tag = 10000;
//	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50.0, 50.0, 50.0, 30.0)];
//	btn.backgroundColor = [UIColor redColor];
//	[btn addTarget:self action:@selector(pupu_show) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:btn];
//	[self.view addSubview:pupu_img];
	
//	CABasicAnimation *hover = [CABasicAnimation animationWithKeyPath:@"position"];
//	hover.additive = YES; // fromValue and toValue will be relative instead of absolute values
//	hover.fromValue = [NSValue valueWithCGPoint:CGPointZero];
//	hover.toValue = [NSValue valueWithCGPoint:CGPointMake(0.0, -10.0)]; // y increases downwards on iOS
//	hover.autoreverses = YES; // Animate back to normal afterwards
//	hover.duration = 0.5; // The duration for one part of the animation (0.2 up and 0.2 down)
//	hover.repeatCount = INFINITY; // The number of times the animation should repeat
//	[_imageVeiw.layer addAnimation:hover forKey:@"myHoverAnimation"];
	
	
	NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
	NSDictionary * normal = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.5255f green:0.5255f blue:0.5255f alpha:1],
							 NSFontAttributeName: [UIFont systemFontOfSize:14],
							 NSParagraphStyleAttributeName: paragraphStyle,
							NSBackgroundColorAttributeName:[UIColor whiteColor]};
	
	NSDictionary * nicknameStyle = @{NSForegroundColorAttributeName: [UIColor greenColor],
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:14],
                                     NSParagraphStyleAttributeName: paragraphStyle};
	NSString *string = @"我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好阿我的谁阿你好";
    NSMutableAttributedString * as = [[NSMutableAttributedString alloc] initWithString:string attributes:normal];
	NSString *nameONe = @"我的";
	
	NSRange rangeName = [string rangeOfString:nameONe];
	[as setAttributes:nicknameStyle range:rangeName];
	
//	[_clickTest setAttributedText:as];
	
	
	CGRect titlebounds = [as boundingRectWithSize:CGSizeMake(260, 9999)
										  options:NSStringDrawingUsesLineFragmentOrigin
										  context:nil];
	CGRect testbounds = [as boundingRectWithSize:CGSizeMake(192, 9999)
										  options:NSStringDrawingUsesLineFragmentOrigin
										  context:nil];
	
	
	[_clickTest setAttributedText:as withSize:titlebounds.size];
	
	[_clickTest setTapBlock:^(NSInteger b) {
		NSLog(@"=====%ld",(long)b);
		//		NSRange range = [string rangeOfString:[NSString stringWithFormat:@"我"]];
		if (NSLocationInRange(b, rangeName))
		{
			NSLog(@"我 被点击");
		}
		
		
		
//		NSRegularExpression * regex = [[NSRegularExpression alloc] initWithPattern:@"@\\S+\\s"
//																		   options:0
//																			 error:nil];
//		NSArray * matches = [regex matchesInString:blog.original_content options:0 range:NSMakeRange(0, blog.original_content.length)];
		
		//			if ([matches count] ==0)
		//			{
		//				BlogsViewController *blogVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BlogsView"];
		//				[blogVC loadWithBlog:blog];
		//				[self.navigationController pushViewController:blogVC animated:YES];
		//				return ;
		//			}
		
//		for (NSTextCheckingResult *result in  matches)
//		{
//			if (NSLocationInRange(p, result.range))
//			{
//				NSString * str = [blog.original_content substringWithRange:NSMakeRange(result.range.location+1, result.range.length-2)];
//				NSLog(@"*********%@",str);
//				
//				for (NSString *nickname in blog.atUsers.allKeys)
//				{
//					if ([nickname isEqual:str])
//					{
//						isMyBlog = YES;
//						user = blog.atUsers[str];
//						
//						[self.delegate blogsTableViewController:self didTapReferredUser:user atIndex:indexPath.row];
//						break;
//					}
//				}
//				
//			}
//		}
		
	}];
	
//	[_test setAttributedText:as withSize:testbounds.size];
//	[_test setTapBlock:^(NSInteger b) {
//		NSLog(@"=====%ld",(long)b);
////		NSRange range = [string rangeOfString:[NSString stringWithFormat:@"我"]];
//		if (NSLocationInRange(b, rangeName))
//		{
//			NSLog(@"我 被点击");
//		}
//	}];
	
	[self blockMethod:^int(int z) {
		return z*z;
	}];
	
	[self objectMethod:^int(int x) {
		return x*x;
	}];
	
	[self method:^(NSString *user) {
		NSLog(@"%@",user);
	}];
	
	
	[self returnDic:^NSDictionary *(NSString *name) {
		return [NSDictionary dictionaryWithObjectsAndKeys:name,name, nil];
	}];
	
//	void myFunction(int (^mySquare)(int));     //function的定义，将Block作为参数
//	int (^mySquare)(int) = ^(int a){return a*a;};   //定义一个mySquare的Block pointer变量
//	myFunction(mySquare);    //把mySquare作为myFunction的参数

	
	self.helloSystem = ^(NSInteger number)
	{
	
	};
	
	self.setvalue = ^(NSString *kayName)
	{
		NSDictionary *dic = @{kayName: kayName};
		return dic;
	};
	
	
	NSLog(@"****************%@",self.setvalue(@"name"));
	NSInteger test = 500000;
	NSString *testString = [NSString stringWithFormat:@"%ld",(long)test];
	NSLog(@"%@",testString);
	NSLog(@"Number is %ld", (long)test);
	NSLog(@"Number is %@", @(test));
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//		NSLog(@"=====================%@",segue.identifier);
//		NextVC *next = segue.destinationViewController;
//		[next setFinshBack:^(NSString *name)
//		 {
//			 NSLog(@"****************%@",name);
//		 }];
}


-(void)pupu_show{
	UIImageView *views = (UIImageView*)_imageVeiw;
	CGPoint p = views.center;
	if (p.x<320-views.frame.size.width/2 && p.x>views.frame.size.width/2) {             //图片左右运动区域
		if (back) {
			if (p.y<480 - views.frame.size.height/2 && p.y>80 + views.frame.size.height/2) {//图片上下运动区域
				if (go) {
					p.x = p.x-10;
					p.y = p.y+10;
					views.center = p;
					go = TRUE;
				}else {
					p.x = p.x-10;
					p.y = p.y-10;
					views.center = p;
					back = TRUE;
				}
			}else if (p.y>480 - views.frame.size.height/2) {                                //图片区域运动的下边界
				p.y = p.y-10;
				views.center = p;
				back = FALSE;
			}else {                                    //图片运动的上边界
				p.y = p.y+10;
				views.center = p;
				go = FALSE;
			}
		}else {
			if (p.y<480 - views.frame.size.height/2 && p.y>80 + views.frame.size.height/2) {//图片上下运动区域
				if (go) {
					p.x = p.x+10;
					p.y = p.y+10;
					views.center = p;
					go = TRUE;
				}else {
					p.x = p.x+10;
					p.y = p.y-10;
					views.center = p;
					back = TRUE;
				}
				back = TRUE;
			}else if (p.y>480 - views.frame.size.height/2) {                                //图片区域运动的下边界
				p.y = p.y-10;
				views.center = p;
				back = FALSE;
			}else {                                    //图片运动的上边界
				p.y = p.y+10;
				views.center = p;
				go = FALSE;
			}
		}
		
	}else if (p.x>320-views.frame.size.width/2) {                                       //图片运动的左边界
		p.x = p.x-p.x/3;
		views.center = p;
		back = FALSE;
	}else {                                                                             //图片运动的右边界
		p.x = p.x+p.x/3;
		views.center = p;
		go = FALSE;
	}
	
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
