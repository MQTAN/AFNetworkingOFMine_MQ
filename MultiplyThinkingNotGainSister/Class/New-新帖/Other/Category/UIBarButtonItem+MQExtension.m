//
//  UIBarButtonItem+MQExtension.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/2.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "UIBarButtonItem+MQExtension.h"

@implementation UIBarButtonItem (MQExtension)
+ (instancetype)itemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)sel{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];

    return [[self alloc] initWithCustomView:btn];
}
@end
