//
//  MQNavigationController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/1.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQNavigationController.h"

@interface MQNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation MQNavigationController
+ (void)initialize{

    //对navigationItem进行皮肤设置
    UINavigationBar *navigaitonBar = [UINavigationBar appearance];
//    [navigaitonBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];

    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor blackColor];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
//    [navigaitonBar setTitleTextAttributes:attr];


    //在这里对全世界的UIBarButtonItem设置皮肤
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];

    [item setTitleTextAttributes:attributes forState:UIControlStateNormal];



    NSMutableDictionary *disableAttr = [NSMutableDictionary dictionary];
    disableAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disableAttr forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;

//    //设置导航栏的背景图片
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

#warning 因为添加了返回自定义按钮,所以会覆盖系统的左滑返回功能,所以要把那个手势的功能找回来.

#pragma mark- 拦截系统的push,统一设置
/**
 *  通过拦截所有的push到下一个控制器.设置一些统一格式的东西.
 *
 *  @param viewController 被push的控制器
 *  @param animated       动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count >= 1) {//push进来之前数组中有控制器的数量
        viewController.hidesBottomBarWhenPushed = YES;
        //更换系统的返回按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}
#pragma mark- 设置返回键
- (void)backClick{
    [self popViewControllerAnimated:YES];
}

#pragma mark- <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}
@end
