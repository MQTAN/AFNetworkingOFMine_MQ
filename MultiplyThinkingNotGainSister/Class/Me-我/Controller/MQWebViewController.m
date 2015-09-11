//
//  MQWebViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQWebViewController.h"
#import "MQSquare.h"

@interface MQWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;

@end

@implementation MQWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseProperty];
}
/**
 *  本控制器的基本属性设置
 */
- (void)setBaseProperty{
    self.title = self.square.name;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_square.url]]];

    self.webView.delegate = self;
    self.view.backgroundColor = MQRandomColor;
    //因为展示在webView上的控件头部有些显示不出来
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}
#pragma mark-监听了点击事件.返回,前进,刷新...
- (IBAction)backClick:(UIBarButtonItem *)sender {
    [self.webView goBack];
}
- (IBAction)forwardClick:(UIBarButtonItem *)sender {
    [self.webView goForward];
}
- (IBAction)refreshClick:(UIBarButtonItem *)sender {
    [self.webView reload];
}
#pragma mark- 代理方法实现
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.backItem.enabled = webView.canGoBack;
    self.forwardItem.enabled = webView.canGoForward;
}
@end
