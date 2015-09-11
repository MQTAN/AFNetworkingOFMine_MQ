//
//  MQLoginRegisterTextField.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/3.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQLoginRegisterTextField.h"
#import <objc/runtime.h>
@implementation MQLoginRegisterTextField
- (void)awakeFromNib{
    //1.设置文本的光标颜色
    self.tintColor = [UIColor whiteColor];
    self.textColor = self.tintColor;
#if 1

    //2.设置占位字体颜色
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
#endif

    [self setUpColorWithCursor];
#if 0

    {//通过运行时设置属性
    /**
     1.什么是运行时（Runtime）?
     * 运行时是苹果提供的纯C语言的开发库（运行时是一种非常牛逼、开发中经常用到的底层技术）

     2.运行时的作用？
     * 能获得某个类的所有成员变量
     * 能获得某个类的所有属性
     * 能获得某个类的所有方法
     * 交换方法实现
     * 能动态添加一个成员变量
     * 能动态添加一个属性
     * 能动态添加一个方法
     */

        unsigned int outCount = 0;
        //1.获取所有成员变量(instanceVari)
        Ivar *ivars = class_copyIvarList([UITextField class], &outCount);
        //2.遍历所有成员变量
        for (int i = 0; i < outCount; i++) {
            //2.1取出对应位置的ivar
            Ivar ivar = ivars[i];
            MQLog(@"%s", ivar_getName(ivar));
        }
        // 如果函数名中包含了copy\new\retain\create等字眼，那么这个函数返回的数据就需要手动释放
        free(ivars);
#if 0

        UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
        //        MQLog(@"%@+++++", placeholderLabel);
        placeholderLabel.textColor = [UIColor grayColor];
#endif

#if 0

        //上面2句可以写成一句
        [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
#endif
    }
#endif
}

#pragma mark- 设置光标到输入框可以改变颜色
- (void)setUpColorWithCursor{
    //方法一.通过代理....但是不推荐使用,因为很容易被外界的东西说覆盖
#if 0

    //方法二:通过监听(继承至UIControl)
    [self addTarget:self action:@selector(beginEditing) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(endEditing) forControlEvents:UIControlEventEditingDidEnd];
#endif
#if 0

    //方法三:通过通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing) name:UITextFieldTextDidEndEditingNotification object:self];
#endif
    //方法四:通过成为第一响应者

}


#pragma mark- 通过成为第一响应者
- (BOOL)becomeFirstResponder{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
[self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)beginEditing{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}
- (void)endEditing{
[self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
@end







// 富文本用法1 - 不可变的属性文字
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    attrs[NSUnderlineStyleAttributeName] = @1;
//    attrs[NSUnderlineColorAttributeName] = [UIColor redColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];

// 富文本用法2 - 可变的属性文字
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
//    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
//    [string addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(1, 1)];
//    [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(1, 1)];
//    self.attributedPlaceholder = string;

// 富文本用法3 - 图文混排
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
//
//    // 第二段：图片
//    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
//    attachment.image = [UIImage imageNamed:@"login_close_icon"];
//    attachment.bounds = CGRectMake(0, 0, 16, 16);
//    NSAttributedString *subtring2 = [NSAttributedString attributedStringWithAttachment:attachment];
//    [string appendAttributedString:subtring2];
//
//    // 第一段：placeholder
//    NSAttributedString *substring1 = [[NSAttributedString alloc] initWithString:self.placeholder];
//    [string appendAttributedString:substring1];
//
//    // 第三段：哈哈
//    NSAttributedString *substring3 = [[NSAttributedString alloc] initWithString:@"哈哈"];
//    [string appendAttributedString:substring3];
//
//    self.attributedPlaceholder = string;