//
//  ZLCTabbarViewController.m
//  CustomTabbar
//
//  Created by shining3d on 16/8/3.
//  Copyright © 2016年 shining3d. All rights reserved.
//

#import "ZLCTabbarViewController.h"
#import "ViewController.h"

#import "ShopViewController.h"
@interface ZLCTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation ZLCTabbarViewController
{
	ShopViewController *two;
	ViewController *one;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"one";
	self.delegate = self;
	
	
	//为tabbar换背景
	UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -8, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
	[imageView setImage:[UIImage imageNamed:@"导航栏"]];
	[imageView setContentMode:UIViewContentModeCenter];
	[self.tabBar insertSubview:imageView atIndex:0];

	
	
	//覆盖原生Tabbar的上横线
	[[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
	[[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
	//设置TintColor
	UITabBar.appearance.tintColor = [UIColor grayColor];
	
	
	//设置tabbar字体颜色及size
	[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:14.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
	[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:14.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
	
	

	one = [[ViewController alloc]init];
	one.title = @"one";
	one.tabBarItem.image = [[UIImage imageNamed:@"商店"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	one.tabBarItem.selectedImage = [[UIImage imageNamed:@"bigshop.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	
	
	
	
	two = [[ShopViewController alloc]init];
	two.title = @"two";
	two.tabBarItem.image = [[UIImage imageNamed:@"我的-0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	two.tabBarItem.selectedImage = [[UIImage imageNamed:@"bigmine.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

	
	self.viewControllers = @[one,two];
	
	

	one.tabBarItem.imageInsets = UIEdgeInsetsMake(-15, 0, 15, 0);

	

}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
	switch (tabBarController.selectedIndex) {
            case 0:
			self.title = @"one";
			two.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
			one.tabBarItem.imageInsets = UIEdgeInsetsMake(-15, 0, 15, 0);


			break;
			case 1:
			self.title = @"two";
			two.tabBarItem.imageInsets = UIEdgeInsetsMake(-15, 0, 15, 0);
			one.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);

			break;
			
            default:
			break;
	}
}





//用颜色返回一张图片
-(UIImage*) createImageWithColor:(UIColor*) color
{
	CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextFillRect(context, rect);
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return theImage;
}

@end
