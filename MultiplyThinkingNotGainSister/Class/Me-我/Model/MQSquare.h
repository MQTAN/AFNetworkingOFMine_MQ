//
//  MQSquare.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQSquare : NSObject
/**图片,按钮的图片*/
@property(nonatomic, copy) NSString *icon;
/**按钮名称*/
@property(nonatomic, copy) NSString *name;
/**点击按钮跳转的路径*/
@property(nonatomic, copy) NSString *url;
@end
