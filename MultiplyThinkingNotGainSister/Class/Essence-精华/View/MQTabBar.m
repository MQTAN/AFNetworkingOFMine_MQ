//
//  MQTabBar.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/1.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQTabBar.h"
#import "MQPublishViewController.h"


@interface MQTabBar ()
/**发布按钮*/
@property(nonatomic, weak) UIButton *publishButton;
@end
@implementation MQTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置TabBar的背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //添加发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [publishButton sizeToFit];
        self.publishButton = publishButton;
        [self addSubview:publishButton];


    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //1.重新布局子空间的位置
    //    MQLogLineFun(@"%@", self.subviews);
    //    MQLogColor(@"%@", self.subviews);
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    NSInteger index = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / 5;
    CGFloat btnH = self.frame.size.height;
    for (UIView *subView in self.subviews) {
        if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat btnX = btnW * ((index > 1) ? (index + 1): index);

        subView.frame = CGRectMake(btnX, btnY, btnW, btnH);

        index++;
    }}
#pragma mark - 跳转到发布控制器
- (void)publishButtonClick{
    MQPublishViewController *vc = [[MQPublishViewController alloc]init];
    [self.window.rootViewController presentViewController:vc animated:NO completion:nil];
}

@end
