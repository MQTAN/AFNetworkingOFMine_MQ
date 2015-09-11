//
//  MQEssenceViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/2.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQEssenceViewController.h"
#import "MQTagViewController.h"

@interface MQEssenceViewController ()

@end

@implementation MQEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MQCommonBackgroundColor;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置左边导航栏的样式
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"]
        target:self
        action:@selector(tagSubIconClick)];
    
}
/**
 *  点击左上的按钮,跳到 推荐标签控制器.
 */
- (void)tagSubIconClick{
    MQTagViewController *vc = [[MQTagViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
