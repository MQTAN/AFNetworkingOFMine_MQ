//
//  MQTagViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/6.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQTagViewController.h"
#import "MQTagViewCell.h"
#import "AFNetworking.h"
#import "MQTagModel.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"

@interface MQTagViewController ()
/**所有的标签数据（里面存放的都是XMGTag模型）*/
@property(nonatomic, strong) NSArray *tags;
/**请求管理者*/
@property(nonatomic, weak) AFHTTPSessionManager *manager;
@end

@implementation MQTagViewController
/**
 *  懒加载请求数据管理者
 */
- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableViewStyle];

    [self requestDataForTableView];

}
//循环利用的标识
static NSString *const MQTagCell = @"tag";
#pragma mark- 设置tableView的格式
- (void)setUpTableViewStyle{
     //注册,通过xib来循环利用cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MQTagViewCell class]) bundle:nil] forCellReuseIdentifier:MQTagCell];
    self.view.backgroundColor = MQCommonBackgroundColor;
    self.navigationItem.title = @"推荐标签";
    self.tableView.rowHeight = 70;
    //移除系统的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
#warning 移除系统的分割线,目的是添加自定义的分割线,有3中做法.\
第一:在xib中自定义一个高度为 1 的View\
第二:通过美工做的背景图片实现\
第三:设置cell的Frame的高度 - 1( 重写它的set方法)
}
#pragma mark- 网络数据请求
- (void)requestDataForTableView{
#warning 因为要考虑网络速度的问题.所以设置蒙版的效果好点
    [SVProgressHUD show];
    //请求数据
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";

    //
    MQWeakSelf;
    [self.manager GET:MQRequestURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        // 将服务器的数据写成plist。方便查看数据结构
        //    [responseObject writeToFile:@"/Users/tanmanqi/Desktop/tag.plist" atomically:YES];

        // responseObject：字典数组
        // self.tags：模型数组
        // responseObject -> self.tags
        //将字典数组转模型
        weakSelf.tags = [MQTagModel objectArrayWithKeyValuesArray:responseObject];
        //刷新表格.
        [weakSelf.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (error.code == NSURLErrorCancelled) {
            return ;
        }
        if (error.code == NSURLErrorTimedOut) {
            [SVProgressHUD showErrorWithStatus:@"网络繁忙,等待,亲~"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"数据加载失败,稍后再试~"];
        }
    }];

}

- (void)dealloc{
    //当用户返回是否,就应该关闭下载,并且关闭弹窗
    [self.manager invalidateSessionCancelingTasks:YES];
    [SVProgressHUD dismiss];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建cell
    MQTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MQTagCell];
    //添加数据
    cell.tagModel = self.tags[indexPath.row];
    //返回cell
    return cell;
}
@end
