//
//  MQRecommendCategory.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/10.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQRecommendCategory : NSObject
/**名字*/
@property(nonatomic, copy) NSString *name;
/**标识*/
@property(nonatomic, copy) NSString *ID;
/**数量*/
@property(nonatomic, copy) NSString *count;
@end
