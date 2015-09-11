//
//  MQPlaceholderTextView.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/9.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQPlaceholderTextView.h"

@implementation MQPlaceholderTextView
//åß∂Ω≈ç√∫˙∆˚¬…æ“‘««≠–ºª••¶¶§∞∞¢£™¡`œ®†®¥
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.keyboardType = UIKeyboardTypeDefault;
        self.font = [UIFont systemFontOfSize:26];
        self.placeholderLabelColor = [UIColor grayColor];
        //使用通知,监听文字该改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}
#pragma mark- 监听通知,用于文字的改变
- (void)textDidChange:(NSNotification *)note{
    MQLogColor(@"%@", note.object);
    [self setNeedsDisplay];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)drawRect:(CGRect)rect{
    if (self.hasText) {
        return;//如果有文字就不进行placeholder的绘画
    }
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSForegroundColorAttributeName] = self.placeholderLabelColor;
    attribute[NSFontAttributeName] = self.font;
    rect.origin.x = 5;
    rect.origin.y= 8;
    rect.size.width -= 2 * rect.origin.x;
    //画文字
    [self.placeholderLabel drawInRect:rect withAttributes:attribute];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self setNeedsDisplay];
}
- (void)setPlaceholderLabel:(NSString *)placeholderLabel{
    _placeholderLabel = [placeholderLabel copy];
    [self setNeedsDisplay];
}

- (void)setPlaceholderLabelColor:(UIColor *)placeholderLabelColor{
    _placeholderLabelColor = placeholderLabelColor;
    [self setNeedsDisplay];

}
- (void)setFont:(UIFont *)font{
    [super setFont:font];

    [self setNeedsDisplay];

}

- (void)setText:(NSString *)text{
    [self setNeedsDisplay];
    [super setText:text];
}



- (void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self setNeedsDisplay];
}
@end
