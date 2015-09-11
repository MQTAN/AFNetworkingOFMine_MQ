
//
//  MQConst.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
// 请求路径
NSString * const MQRequestURL = @"http://api.budejie.com/api/api_open.php";
/** 统一的间距 */
CGFloat const MQCommonMargin = 10;

/**
 全局常量的写法
 1.仅限于本文件访问
 在本文件（.m）中写下面的代码
 static 类型 const 常量名 = 常量值;

 2.全世界都要访问
 1> 在XMGConst.m文件中
 #import <UIKit/UIKit.h>
 类型 const 常量名 = 常量值;

 2> 在XMGConst.h文件中
 #import <UIKit/UIKit.h>
 UIKIT_EXTERN 类型 const 常量名;

 3> 在pch中包含XMGConst.h文件
 #import "XMGConst.h"
 */