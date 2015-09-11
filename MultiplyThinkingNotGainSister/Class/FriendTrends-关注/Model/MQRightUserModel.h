//
//  MQRightUserModel.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQRightUserModel : NSObject
/**名称*/
@property(nonatomic, copy) NSString *screen_name;
/**用户订阅数*/
@property(nonatomic, copy) NSString *uid;
/**标题图盘*/
@property(nonatomic, copy) NSString *header;

/**粉丝数量*/
@property(nonatomic, copy) NSString *fans_count;
@end
