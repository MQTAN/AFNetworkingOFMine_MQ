//
//  UIImage+MQExtension.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//
/**
 *  这个分类主要是对UIImage的功能扩展
 */
#import "UIImage+MQExtension.h"

@implementation UIImage (MQExtension)
/**
 *  通过图片对象调用返回一张圆形图片
 */
- (instancetype)circleImage{
    //1.开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);

    //添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    //裁剪
    CGContextClip(ctx);
    //往圆上画一张图片
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return image;
}
/**
 *  返回一张圆形图片
 */
+ (instancetype)imageCirclelyWithName:(NSString *)name{

    return [[self imageNamed:name] circleImage];
}
@end
