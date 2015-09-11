//
//  MQRecommendUserCellCell.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MQRightUserModel;
@interface MQRecommendUserCell : UITableViewCell
/**数据模型*/
@property(nonatomic, strong) MQRightUserModel *userModel;
@end
