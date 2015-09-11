//
//  UIImageView+MQExtension.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "UIImageView+MQExtension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (MQExtension)
- (void)setHeaderImage:(NSString *)url{
    [self setRectHeader:url];
}
- (void)setCircleHeader:(NSString *)url{
    MQWeakSelf;
    UIImage *placeholder = [UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
        if (image == nil) return;
        weakSelf.image = [image circleImage];
    }];
}

- (void)setRectHeader:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
