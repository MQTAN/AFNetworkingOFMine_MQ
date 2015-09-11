//
//  UIBarButtonItem+MQExtension.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/2.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MQExtension)
/**
 *  给导航栏设置左边或者右边的按钮
 *
 *  @param image          普通状态的图片
 *  @param highlightImage 高亮状态的图片
 *  @param target         谁触发
 *  @param sel            调用谁的方法
 *
 *  @return 返回一个控件显示到导航栏左边或者右边
 */
+ (instancetype)itemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)sel;
@end
