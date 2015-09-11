//
//  MQTagViewCell.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/6.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQTagViewCell.h"
#import "UIImageView+WebCache.h"
#import "MQTagModel.h"


@interface MQTagViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end
@implementation MQTagViewCell


- (void)awakeFromNib
{
    // 如果使用过于频繁，可能会导致拖拽起来的感觉比较卡
    //    self.imageListView.layer.cornerRadius = self.imageListView.width * 0.5;
    //    self.imageListView.layer.masksToBounds = YES;
}

- (void)setTagModel:(MQTagModel *)tagModel{
    _tagModel = tagModel;

//
//    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:tagModel.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
//

#warning 为了实现项目经理一会儿改方形图片,一会儿该圆形图片.所以还得继续封装.

//    MQWeakSelf;
//    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:tagModel.image_list] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        if (image == nil) {
//            return ;
//        }
//        weakSelf.imageListView.image = [image circleImage];
//    }];


    //应该提供这样的接口来实现给UIImageView设置头像.可以使仅仅是修改接口就能够实现把项目中所有用到这里的都进行修改
    [self.imageListView setHeaderImage:tagModel.image_list];
    self.themeNameLabel.text = tagModel.theme_name;

    //订阅数
    if ([tagModel.sub_number integerValue] >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅", [tagModel.sub_number integerValue] / 10000.0];
    }else{
        self.subNumberLabel.text = [NSString stringWithFormat:@"%@人订阅", tagModel.sub_number];
    }
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 1;
    [super setFrame:frame];
}

/**
 *  最后一个问题是处理全局变量的问题.
 */
@end
