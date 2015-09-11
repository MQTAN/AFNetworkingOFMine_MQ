//
//  UIImageView+MQExtension.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+MQExtension.h"

@interface UIImageView (MQExtension)
/**
 *  给本控件添加一个设置头部图片的方法,外界提供一个图片的url就可以实现头部图片设置为圆角或者是方形
 */
- (void)setHeaderImage:(NSString *)url;
@end
