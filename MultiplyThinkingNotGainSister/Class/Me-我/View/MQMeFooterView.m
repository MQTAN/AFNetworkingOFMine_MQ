//
//  MQMeFooterView.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQMeFooterView.h"
#import <AFNetworking.h>
#import "MQSquare.h"
#import "MJExtension.h"
//#import "UIButton+WebCache.h"
#import "MQSquareButton.h"
#import "MQWebViewController.h"

@implementation MQMeFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
        // 请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        //发送请求
        MQWeakSelf;
        [[AFHTTPSessionManager manager] GET:MQRequestURL parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            //讲网络请求数据写入到桌面的plist文件当中
//            [responseObject writeToFile:@"/Users/tanmanqi/Desktop/square.plist" atomically:YES];

            [weakSelf createSquares:[MQSquare objectArrayWithKeyValuesArray:responseObject[@"square_list"]]];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {

        }];
    }
    return self;
}
/**
 *  创建方块
 */
- (void)createSquares:(NSArray *)squares{
    self.backgroundColor = MQRandomColor;
    //每行的列数
    NSUInteger colsCount = 4;
    //按钮尺寸
    CGFloat btnW = self.width / colsCount;
    CGFloat btnH = btnW;
    //遍历所有模型
    NSUInteger count = squares.count;
    for (NSUInteger i = 0; i < count; i++) {
//        MQSquare *square = squares[i];
        //创建按钮
        MQSquareButton *button = [MQSquareButton buttonWithType:UIButtonTypeCustom];
        //监听点击事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:button];


        CGFloat btnX = (i % colsCount) * btnW;
        CGFloat btnY = (i / colsCount) * btnH;
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //在这里一定要设置数据模型传给button.好拿到点击事件去判断
        //设置数据模型
        button.squareButtonModel = squares[i];
//        button.backgroundColor = MQRandomColor;
//        //给按钮设置数据
#warning 因为这里其实不属于本类的事情,最好是交给Button来完成
//        [button setTitle:square.name forState:UIControlStateNormal];
//
//        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal];
#warning 在这里用系统的图片的话,界面非常的low.所以需要自定义按钮来布局子控件.
        //可以在这里设置本控件的高度.
//        self.height = CGRectGetMaxY(button.frame);

    }
    // 设置footer的高度
    //    NSUInteger rowsCount = count / colsCount;
    //    if (count % colsCount) { // 不能整除，行数+1
    //        rowsCount++;
    //    }
    NSUInteger rowsCount = (count + colsCount - 1) / colsCount;
    self.height = rowsCount * btnH;

    // 重新设置footerView
    UITableView *tableView = (UITableView *)self.superview;
    //    tableView.tableFooterView = self;
    tableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));

    // 总页数 == (总个数 + 每页的个数 - 1) / 每页的个数

    // 总个数：97
    // 每页的个数：17
    // 总页数 =  (97 + 17 - 1) / 17

}

/**
 1个控件不能响应点击事件，原因可能有：
 1> userInteractionEnabled = NO;
 2> enabled = NO;
 3> 父控件的userInteractionEnabled = NO;
 4> 父控件的enabled = NO;
 5> 控件已经超出父控件的边框范围
 */
- (void)buttonClick:(MQSquareButton *)button{

    MQLogLine;
    //因为跳转的时候要拿到模型中的标题和网址的链接.所以直接在Button中包含模型就可以轻松的拿到了
    if ([button.squareButtonModel.url hasPrefix:@"http"]) {
        MQWebViewController *vc = [[MQWebViewController alloc] init];
        vc.square = button.squareButtonModel;
        //取出当前选中的导航控制器
        UITabBarController *rootVC = (UITabBarController *)self.window.rootViewController;
        UINavigationController *currentNav = (UINavigationController *)rootVC.selectedViewController;
        [currentNav pushViewController:vc animated:YES];
    }
    
}
@end
