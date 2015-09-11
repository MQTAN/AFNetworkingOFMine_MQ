//
//  MQSquareButton.h
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/7.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MQSquare;
@interface MQSquareButton : UIButton
/**方块中的模型,在Button中用于点击跳转到下一个控制器中拿到它的数据*/
@property(nonatomic, strong) MQSquare *squareButtonModel;
@end
