//
//  MQPublishViewController.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/9.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQPublishViewController.h"
#import "MQPublishButton.h"
#import "POP.h"
#import "MQPostWordViewController.h"
#import "MQNavigationController.h"
@interface MQPublishViewController ()
/**标语*/
@property(nonatomic, weak) UIImageView *sloganView;
/**动画时间保存*/
@property(nonatomic, strong) NSArray *times;
/**保存按钮*/
@property(nonatomic, strong) NSMutableArray *buttons;
@end

@implementation MQPublishViewController
- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


- (NSArray *)times{
    if (!_times) {
        CGFloat interval = 0;
        _times = @[@(5 * interval),
                   @(2 * interval),
                   @(4 * interval),
                   @(1 * interval),
                   @(3 * interval),
                   @(0 * interval),
                   @(6 * interval),
                   ];
    }
    return _times;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = NO;
    [self setUpSlogan];
    [self setUpButton];

}


#pragma mark- 退出动画
- (void)exist:(void (^)())compleleExist{
    //禁止交互
    self.view.userInteractionEnabled = NO;

    //让按钮执行动画
    for (int i = 0; i < self.buttons.count; i++) {
        MQPublishButton *btn = self.buttons[i];

        POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        animation.toValue = @(btn.layer.position.y + MQMainScreenHeight);
        animation.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [btn.layer pop_addAnimation:animation forKey:nil];
    }

    //让slogan执行动画
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(MQMainScreenHeight * 2);
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
        [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:NO completion:nil];
        if (compleleExist) {
            compleleExist();
        }
    }];
    [self.sloganView.layer pop_addAnimation:anim forKey:nil];
    

}
#pragma mark- 设置标题的显示和动画.
- (void)setUpSlogan{
    self.view.backgroundColor = MQRandomColor;
    //创建标语
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    self.sloganView = sloganView;
    _sloganView.y = -MQMainScreenHeight;
    _sloganView.centerX = MQMainScreenWidth * .5;
    [self.view addSubview:sloganView];


    //添加动画
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];

    anim.toValue = @(MQMainScreenHeight * 0.15);
    anim.springBounciness = 8;
    anim.springSpeed = 8;
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    MQWeakSelf;
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
        weakSelf.view.userInteractionEnabled = YES;
    }];
    [self.sloganView.layer pop_addAnimation:anim forKey:nil];

}
- (void)setUpButton{
    //添加按钮
    // 按钮
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    //一行的列数
    NSUInteger colCountPerRow = 3;
    NSUInteger rowCounts = (images.count + colCountPerRow - 1) / colCountPerRow;
    //按钮的尺寸
    CGFloat btnW = MQMainScreenWidth / colCountPerRow;
    CGFloat btnH = btnW * .95;
    CGFloat btnStartY = (MQMainScreenHeight - rowCounts * btnH) * 0.5;
    for (int i = 0; i < images.count; i++) {
        //创建按钮
        MQPublishButton *btn = [MQPublishButton buttonWithType:UIButtonTypeCustom];
        [self.buttons addObject:btn];

        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        //设置btn的Frame
        CGFloat btnX = (i % colCountPerRow) * btnW;
        CGFloat btnY = btnStartY + (i / colCountPerRow) * btnH;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //设置btn的内容
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        //添加动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnY - MQMainScreenHeight, btnW, btnH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(btnX, btnY, btnW, btnH)];
        anim.springBounciness = 8;
        anim.springSpeed = 8;
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [btn pop_addAnimation:anim forKey:nil];
        
    }

}
- (void)btnClick:(MQPublishButton *)button{
//    MQLogColor();
    [self exist:^{
        NSUInteger index = [self.buttons indexOfObject:button];
        switch (index) {
            case 2://发段子
            {
                MQPostWordViewController *postWordVC = [[MQPostWordViewController alloc]init];
                MQNavigationController *nav = [[MQNavigationController alloc] initWithRootViewController:postWordVC];
                [self.view.window.rootViewController presentViewController:nav animated:YES completion:nil];
                break;
            }
            default:
                break;
        }
    }];
}
- (IBAction)cancelButton:(UIButton *)sender forEvent:(UIEvent *)event {
    [self exist:nil];

}

- (void)dealloc{
//    MQLogColor(@"%@", [self class]);
}
@end
