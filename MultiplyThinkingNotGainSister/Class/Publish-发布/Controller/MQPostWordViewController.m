//
//  MQPostWordViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/9.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQPostWordViewController.h"
#import "MQPlaceholderTextView.h"

@interface MQPostWordViewController ()<UITextViewDelegate>
/**文本框*/
@property(nonatomic, weak) MQPlaceholderTextView *textView;
@end

@implementation MQPostWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"发表文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;

    //强制刷新,否则这个不可以点击将不会变色.__通过皮肤设置的
    [self.navigationController.navigationBar layoutIfNeeded];
//    [self.view layoutIfNeeded];
    MQLogColor(@"self.navigationController.navigationBar = %@", self.navigationController.navigationBar);
    [self setUpTextView];
}
/*
 // 重新刷新自己和子控件的所有内容（状态、尺寸）
 [tempView layoutIfNeeded];
 // 重新调用tempView的layoutSubviews（重新排布子控件的frame）
 [tempView setNeedsLayout];
 // 重新调用tempView的drawRect:方法（重新绘制tempView里面的内容，一般不包括子控件）
 [tempView setNeedsDisplay];
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
//    self.textView.frame = self.view.bounds;
    MQLogColor(@"%@", NSStringFromCGRect(self.textView.frame));
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.navigationController.navigationBar layoutIfNeeded];
//    [self.view layoutIfNeeded];
}
- (void)post{
    MQLogColor();
}
- (void)cancel{
    MQLogColor();
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)setUpTextView{
    MQPlaceholderTextView *textView = [[MQPlaceholderTextView alloc] init];
    //实现拖拽
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    textView.frame = self.view.bounds;
    [self.view addSubview:textView];
    self.textView.font = [UIFont systemFontOfSize:17];
    textView.placeholderLabel = @"把好玩的图片，好笑的段子或糗事发到这里，接受千万网友膜拜吧！发布违反国家法律内容的，我们将依法提交给有关部门处理。";
    textView.backgroundColor = MQRandomColor;
    self.view.backgroundColor = [UIColor whiteColor];
    MQLogColor(@"%@", NSStringFromCGRect(textView.frame));
    MQLogColor(@"%@", NSStringFromCGRect(self.view.bounds));
    self.textView = textView;
}

//实现拖拽可以退下键盘的.
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}
@end
