//
//  MQTabBarController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/1.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQTabBarController.h"
#import "MQNavigationController.h"
#import "MQTabBar.h"
#import "MQEssenceViewController.h"
#import "MQMeViewController.h"
#import "MQNewViewController.h"
#import "MQFriendTrendsViewController.h"

@interface MQTabBarController ()

@end

@implementation MQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewController];
    [self setupItem];

}
#pragma mark- 添加一个子控制器
- (void)setOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectImage{
    //设置图片和文字
    vc.navigationItem.title     = title;
    vc.tabBarItem.title         = title;
    vc.tabBarItem.image         = image;
    vc.tabBarItem.selectedImage = selectImage;
    //包装成导航控制器
    MQNavigationController *nav = [[MQNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];

}
#pragma mark- 添加Item所有的控制器
- (void)setUpChildViewController{

    //3.关注

    [self setOneChildViewController:[[MQFriendTrendsViewController alloc]init] title:@"关注" image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectedImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    //1.添加第一个控制器
    [self setOneChildViewController:[[MQEssenceViewController alloc] init]title:@"精华" image:[UIImage imageNamed:@"tabBar_essence_icon"] selectedImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];

    //4.我
    [self setOneChildViewController:[[MQMeViewController alloc]initWithStyle:UITableViewStyleGrouped] title:@"我" image:[UIImage imageNamed:@"tabBar_me_icon"] selectedImage:[UIImage imageNamed:@"tabBar_me_click_icon"]];





    //2.添加第二个控制器
    [self setOneChildViewController:[[MQNewViewController alloc]init] title:@"新帖" image:[UIImage imageNamed:@"tabBar_new_icon"] selectedImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];



    //5.更换TabBar...通过kvc方式更换.
    [self setValue:[[MQTabBar alloc] init] forKeyPath:@"tabBar"];

}

#pragma mark- appearance设置皮肤
/**
 *  设置Item的属性
 *  通过appearance设置皮肤样式,可以设置到全局.
 */

- (void)setupItem{
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectAttr = [NSMutableDictionary dictionary];
    selectAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttr forState:UIControlStateSelected];
}
@end
