//
//  MQNewViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQNewViewController.h"

@interface MQNewViewController ()

@end

@implementation MQNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MQCommonBackgroundColor;
    //设置导航栏的标题View

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置左边标题栏的东西
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];

}
- (void)tagClick{
    
}
@end
