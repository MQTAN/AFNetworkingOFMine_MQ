//
//  NSString+MQExtension.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "NSString+MQExtension.h"

@implementation NSString (MQExtension)
/**
 *  提供一个路径,计算它的文件的大小
 *  @return 返回文件或者文件夹的大小
 */
- (NSUInteger)fileSize{
    NSUInteger size = 0;
    //1.获取沙盒路径

    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    //判断文件夹是否存在
    BOOL isDirectory = NO;
    BOOL exist = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    //路径存在后
    if (!exist) {
        return 0;
    }
    if (isDirectory) {//文件夹


    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
    //MQLogColor(@"%@", subPaths);
    //遍历所有文件,从而获取
    for (NSString *subPath in enumerator) {
        //获取全路径..(获取到了文件夹中所有文件的路径)
        NSString *fullSubPath = [self stringByAppendingPathComponent:subPath];
        //MQLogColor(@"%@", fullSubPath);
        //通过文件管理者获取文件的属性
        NSDictionary *attribute = [manager attributesOfItemAtPath:fullSubPath error:nil];
        //MQLogColor(@"%@", attribute);
        //计算沙盒大小
        //size += [attribute[NSFileSize] integerValue];
        //或者写成
        size += attribute.fileSize;

    }
    return size;
    }else{//文件
        return [manager attributesOfItemAtPath:self error:nil].fileSize;
    }
}
@end
