//
//  MQFriendTrendsViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQFriendTrendsViewController.h"
#import "MQRegisterViewController.h"
#import "MQRecommendViewController.h"

@interface MQFriendTrendsViewController ()

@end

@implementation MQFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MQCommonBackgroundColor;
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecommentClick)];

}
- (void)friendsRecommentClick{
    MQRecommendViewController *recommendVC = [[MQRecommendViewController alloc] init];
    [self.navigationController pushViewController:recommendVC animated:YES];
    
}

//登陆按钮点击
- (IBAction)loginRegister:(UIButton *)sender forEvent:(UIEvent *)event {

    MQRegisterViewController *registerVC = [[MQRegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:nil];
}
@end
