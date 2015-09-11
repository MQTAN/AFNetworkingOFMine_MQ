//
//  MQRecommendCategoryCell.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQRecommendCategoryCell.h"
#import "MQRecommendCategory.h"


@interface MQRecommendCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *selectIndicatorView;

@end
@implementation MQRecommendCategoryCell

- (void)awakeFromNib {
    //通过xib创建cell才会来到这个方法
    self.selectIndicatorView.backgroundColor = MQRGBColor(219, 21, 26);
    self.contentView.backgroundColor = MQRGBColor(244, 244, 244);
    self.backgroundColor = MQRGBColor(244, 244, 244);
    self.textLabel.textColor = MQRGBColor(78, 78, 78);
}

- (void)setCategorye:(MQRecommendCategory *)categorye{
    _categorye = categorye;
    self.textLabel.text = categorye.name;
}
/**
 *  当一个cell 被选中的时候就会来到这个方法
 *
 *  @param selected
 *  @param animated
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    MQLogColor();

    self.selectIndicatorView.hidden = !selected;
    self.backgroundColor = MQRGBColor(244, 244, 244);
    self.textLabel.textColor = selected ? self.selectIndicatorView.backgroundColor : MQRGBColor(78, 78, 78);
//    self.textLabel.textColor = self.selectIndicatorView.backgroundColor;
    // Configure the view for the selected state
}
- (void)layoutSubviews{
    [super layoutSubviews];

    //重新调整textLabel的高度
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}
@end
