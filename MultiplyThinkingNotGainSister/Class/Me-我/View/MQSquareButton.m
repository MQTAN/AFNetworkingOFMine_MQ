//
//  MQSquareButton.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQSquareButton.h"
#import "MQSquare.h"
#import "UIButton+WebCache.h"

@implementation MQSquareButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //通过代码创建这种类型的对象都会调用这个方法..
        //        self.backgroundColor = MQRandomColor;

        //因为这个背景图片本来就是有边跨的.所以不需要再去调节里面的分割线.但是没有的话可以通过高度和宽度-1的方法来实现
        //        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


#warning 在这个layoutSubview中一般是布局这个控件中子控件的位置.
- (void)layoutSubviews{
    [super layoutSubviews];
    //布局图片的子控件位置
    self.imageView.y = self.height * 0.05;
    self.imageView.height = self.height * 0.6;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * .5;

    //布局文字
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + 10;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    self.titleLabel.x = 0;
}
/**
 *  在这个方法中用于展示方框中有分割线的实现.
 */
- (void)setFrame:(CGRect)frame{
    frame.size.width -= 1;
    frame.size.height -= 1;
    [super setFrame:frame];
}

- (void)setSquareButtonModel:(MQSquare *)squareButtonModel{
    _squareButtonModel = squareButtonModel;
    // 数据
    [self setTitle:squareButtonModel.name forState:UIControlStateNormal];

    [self sd_setImageWithURL:[NSURL URLWithString:squareButtonModel.icon] forState:UIControlStateNormal];
}
@end
