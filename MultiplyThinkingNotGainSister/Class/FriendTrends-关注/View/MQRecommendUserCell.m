//
//  MQRecommendUserCellCell.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQRecommendUserCell.h"
#import "MQRightUserModel.h"
#import "UIImageView+WebCache.h"



@interface MQRecommendUserCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fanCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end
@implementation MQRecommendUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUserModel:(MQRightUserModel *)userModel{
    _userModel = userModel;
    self.nameLabel.text = userModel.screen_name;
//    self.nameLabel.text = @"xxx";
//    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:userModel.header] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//    }];

    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:userModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.fanCountLabel.text = [NSString stringWithFormat:@"%@人订阅", userModel.fans_count];
}
@end
