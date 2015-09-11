//
//  MQTagModel.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/6.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQTagModel : NSObject
/**图片*/
@property(nonatomic, copy) NSString *image_list;
/**订阅数*/
@property(nonatomic, copy) NSString *sub_number;
/**标题*/
@property(nonatomic, copy) NSString *theme_name;
@end
