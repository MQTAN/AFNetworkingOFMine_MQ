//
//  MQSettingViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQSettingViewController.h"
#import "MQClearCachesViewCell.h"

@interface MQSettingViewController ()

@end

@implementation MQSettingViewController
static NSString *const MQCachesCellID = @"cachesCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = MQCommonBackgroundColor;
//    [self getFileSize2];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        MQLogColor(@"%.1fMB",[@"/Users/tanmanqi/Desktop/MQiOSCode" fileSize] / 1000.0 / 1000.0);
//        NSString *file = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
//        MQLogColor(@"%@ , %.1lf",file, file.fileSize / 1000.0 / 1000.0);
////
//    });
    //注册cell
    [self.tableView registerClass:[MQClearCachesViewCell class] forCellReuseIdentifier:MQCachesCellID];


}

#pragma mark- 或得文件夹的大小
- (void)getFileSize{
    NSUInteger size = 0;
    //1.获取沙盒路径
    //这个方法常用于获取文件的沙盒临时路径
    //MQLogColor(@"%@", NSTemporaryDirectory());
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //MQLogColor(@"%@", caches);
    NSString *filePath = [caches stringByAppendingPathComponent:@"default"];
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //从文件夹中获取所有文件的内容
    NSArray *subPaths = [manager subpathsAtPath:filePath];
    //MQLogColor(@"%@", subPaths);
    //遍历所有文件,从而获取
    for (NSString *subPath in subPaths) {
        //获取全路径..(获取到了文件夹中所有文件的路径)
        NSString *fullSubPath = [filePath stringByAppendingPathComponent:subPath];
        //MQLogColor(@"%@", fullSubPath);
        //通过文件管理者获取文件的属性
        NSDictionary *attribute = [manager attributesOfItemAtPath:fullSubPath error:nil];
        //MQLogColor(@"%@", attribute);
        //计算沙盒大小
        //size += [attribute[NSFileSize] integerValue];
        //或者写成
        size += attribute.fileSize;

    }
    //2.查看沙盒文件的属性
    MQLogColor(@"%.1fMB", size / 1000.0 / 1000.0);
}

- (void)getFileSize2{
    NSUInteger size = 0;
    //1.获取沙盒路径
    //这个方法常用于获取文件的沙盒临时路径
    //MQLogColor(@"%@", NSTemporaryDirectory());
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //MQLogColor(@"%@", caches);
    NSString *filePath = [caches stringByAppendingPathComponent:@"default"];
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //从文件夹中获取所有文件的内容
//    NSArray *subPaths = [manager subpathsAtPath:filePath];
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:filePath];
    //MQLogColor(@"%@", subPaths);
    //遍历所有文件,从而获取
    for (NSString *subPath in enumerator) {
        //获取全路径..(获取到了文件夹中所有文件的路径)
        NSString *fullSubPath = [filePath stringByAppendingPathComponent:subPath];
        //MQLogColor(@"%@", fullSubPath);
        //通过文件管理者获取文件的属性
        NSDictionary *attribute = [manager attributesOfItemAtPath:fullSubPath error:nil];
        //MQLogColor(@"%@", attribute);
        //计算沙盒大小
        //size += [attribute[NSFileSize] integerValue];
        //或者写成
        size += attribute.fileSize;

    }
    //2.查看沙盒文件的属性
    MQLogColor(@"%.1fMB", size / 1000.0 / 1000.0);
}
#pragma mark- 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MQClearCachesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MQCachesCellID];

    return cell;
}
#pragma mark- 代理方法监听.点击cell删除文件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //清除缓存
    
}
@end
