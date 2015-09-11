//
//  NSString+MQExtension.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MQExtension)
/**
 *  提供一个路径,计算它的文件的大小
 *  @return 返回文件或者文件夹的大小
 */
- (NSUInteger)fileSize;
@end
