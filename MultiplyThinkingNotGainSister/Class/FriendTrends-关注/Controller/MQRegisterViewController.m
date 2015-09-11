//
//  MQRegisterViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQRegisterViewController.h"

@interface MQRegisterViewController ()

@end

@implementation MQRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// iOS7之前修改状态栏样式
// [UIApplication sharedApplication].statusBarStyle;
// iOS7开始由控制器来修改状态栏样式
/**
 * 让状态栏样式为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (IBAction)closeClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
