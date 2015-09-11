//
//  MQRecommendViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQRecommendViewController.h"
#import "MQRecommendCategoryCell.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MQRecommendCategory.h"
#import "MQRecommendUserCell.h"
#import "MQRightUserModel.h"

@interface MQRecommendViewController ()<UITableViewDelegate, UITableViewDataSource>
/**
 *  左边的Tabview控件
 */
@property (weak, nonatomic) IBOutlet UITableView *RecommendCategoryTabview;
/**数据模型保存.左边的tableView的数据模型*/
@property(nonatomic, strong) NSArray *recommendCategoryes;
/**
 *  右边的Tabview控件
 */
@property (weak, nonatomic) IBOutlet UITableView *rightUserTabview;
/**右边数据模型*/
@property(nonatomic, strong) NSArray *useres;
@end

@implementation MQRecommendViewController


static NSString *const MQRecommendLeftCellID = @"MQRecommendLeftCellID";
static NSString *const MQRecommendUserCellID = @"MQRecommendUserCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestForLeftTabview];
    [self setUpTableView];

    UIButton;
#warning 一定要记得设置数据源.不然tabView是不会工作的了!!!

    //做东西的思路.一定要先弄个假的数据展示在控件上面才..其他的一切都是在它之后才展开的...
}
#pragma mark- 左边tableview网络数据请求
- (void)requestForLeftTabview{
    //告诉MJ需要将模型中的 key换位json中的那个key;
    [MQRecommendCategory setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:MQRequestURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        //        MQLogColor(@"%@", responseObject);
        //        MQWriteToPlist(responseObject,@"recommend");
        self.recommendCategoryes = [MQRecommendCategory objectArrayWithKeyValuesArray:responseObject[@"list"]];

#warning 网络请求完成之后一定属性数据.不然不会显示
        [self.RecommendCategoryTabview reloadData];
        //默认选中首行
        [self.RecommendCategoryTabview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];





        //        MQLogColor();
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];

}
#pragma mark- tableview基本设置
- (void)setUpTableView{
    //注册左边cell
    [self.RecommendCategoryTabview registerNib:[UINib nibWithNibName:NSStringFromClass([MQRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:MQRecommendLeftCellID];
    //注册右边cell
    [self.rightUserTabview registerNib:[UINib nibWithNibName:NSStringFromClass([MQRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:MQRecommendUserCellID];
    self.RecommendCategoryTabview.backgroundColor = MQRGBColor(244, 244, 244);
    self.navigationItem.title = @"推荐关注";
    self.RecommendCategoryTabview.showsVerticalScrollIndicator = NO;
    self.view.backgroundColor = MQCommonBackgroundColor;
    self.rightUserTabview.backgroundColor = MQRGBColor(244, 244, 244);
    self.rightUserTabview.rowHeight = 70;
    self.rightUserTabview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
//    self.RecommendCategoryTabview.contentInset = self.rightUserTabview.contentInset;
}

#pragma mark- Tabview数据源方法.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.RecommendCategoryTabview) {
        return self.recommendCategoryes.count;
    }else{
        
        return self.useres.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == self.RecommendCategoryTabview) {
        MQRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:MQRecommendLeftCellID];
        cell.categorye = self.recommendCategoryes[indexPath.row];
        return cell;

    }else{
        MQRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:MQRecommendUserCellID];
        
        cell.userModel = self.useres[indexPath.row];
        return cell;
    }

}

#pragma mark- Tabview代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //通过点击cell才会调用这个方法.默认是不会调用这个方法的.
    MQLogColor(@"didSelectRowAtIndexPath");
    MQRecommendCategory *category = self.recommendCategoryes[indexPath.row];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = category.ID;
        [[AFHTTPSessionManager manager] GET:MQRequestURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            self.useres = [MQRightUserModel objectArrayWithKeyValuesArray:responseObject[@"list"]];


            [self.rightUserTabview reloadData];
            [self.rightUserTabview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
            //        MQWriteToPlist(responseObject, @"user");
        } failure:^(NSURLSessionDataTask *task, NSError *error) {

        }];
        
    });
    


}
@end
