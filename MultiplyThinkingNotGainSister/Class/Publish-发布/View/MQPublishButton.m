//
//  MQPublishButton.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/9.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQPublishButton.h"

@implementation MQPublishButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];


    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = self.height * 0.02;
    //self.imageView.height = self.height * 0.5;
    self.imageView.centerX = self.width * 0.5;


    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}
@end
