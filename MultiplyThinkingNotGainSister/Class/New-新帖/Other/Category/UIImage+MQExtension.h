//
//  UIImage+MQExtension.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//
/**
 *  这个分类主要是对UIImage的功能扩展
 */
#import <UIKit/UIKit.h>

@interface UIImage (MQExtension)
/**
 *  通过图片对象调用返回一张圆形图片
 */
- (instancetype)circleImage;
/**
 *  返回一张圆形图片
 */
+ (instancetype)imageCirclelyWithName:(NSString *)name;
@end
