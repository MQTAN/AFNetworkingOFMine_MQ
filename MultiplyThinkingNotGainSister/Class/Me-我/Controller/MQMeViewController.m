//
//  MQMeViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQMeViewController.h"
#import "MQSettingViewController.h"
#import "MQMeCell.h"
#import "MQMeFooterView.h"
@interface MQMeViewController ()

@end

@implementation MQMeViewController
//只有本文件可以用的循环利用的静态cell
static NSString *const MQMeCellID = @"meCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabView];
    
}

#pragma mark- 设置TabView和导航栏
- (void)setUpTabView{
       //注册cell
    [self.tableView registerClass:[MQMeCell class] forCellReuseIdentifier:MQMeCellID];

    //self.title = @"我的";
    //如果设置title也会把底部的tabBar的文字更换

    self.view.backgroundColor = MQCommonBackgroundColor;
    self.navigationItem.title = @"我的";
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] highlightImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moonClick)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highlightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    //设置tabView的

    self.tableView.backgroundColor = MQCommonBackgroundColor;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = MQCommonMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(MQCommonMargin - 35, 0, 0, 0);

    //设置footerView
#warning 因为通过如此创建的footerView.无法得到它的Frame.所以在之后要给定它的Frame.否则,添加在它上面的子控件根本无法接受点击事件.
    self.tableView.tableFooterView = [[MQMeFooterView alloc] init];
//    self.tableView.tableFooterView.backgroundColor = [UIColor redColor];
//    MQLogLineFun(@"%f", self.tableView.tableFooterView.height);
}
#pragma mark-有点按钮点击事件
- (void)settingClick{
    //点击了设置按钮Push到下一个控制器
    MQSettingViewController *settingVC = [[MQSettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
- (void)moonClick{

}
#pragma mark- tabView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MQMeCell *cell = [tableView dequeueReusableCellWithIdentifier:MQMeCellID];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"mine_icon_random"];
    }else{
        cell.textLabel.text = @"离线下载";
    }
    return cell;
}
@end
