//
//  MQPlaceholderTextView.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/9.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MQPlaceholderTextView : UITextView
/**占位文字*/
@property(nonatomic, copy) NSString *placeholderLabel;
/**占位文字颜色*/
@property(nonatomic, strong) UIColor *placeholderLabelColor;
@end
