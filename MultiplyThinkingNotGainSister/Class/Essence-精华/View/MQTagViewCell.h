//
//  MQTagViewCell.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/6.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MQTagModel;
@interface MQTagViewCell : UITableViewCell
/**标签模型*/
@property(nonatomic, copy) MQTagModel *tagModel;
@end
