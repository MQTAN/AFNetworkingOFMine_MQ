//
//  MQClearCachesViewCell.m
//  MultiplyThinkingNotGainSister
//
//  Created by tanmanqi on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQClearCachesViewCell.h"
#import "SVProgressHUD.h"

@implementation MQClearCachesViewCell

static NSString *const MQDefaultText = @"清除缓存";
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:
                reuseIdentifier]) {

        self.textLabel.text = MQDefaultText;
        //禁止点击事件
        self.userInteractionEnabled = NO;
        //求出缓存路径
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"default"];
        MQLogColor(@"%@", filePath);
        //显示右边圈圈
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        //计算文件缓存的大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSUInteger size = filePath.fileSize;
            CGFloat unit = 1000.0;
            NSString *sizeText = nil;
            if (size >= unit * unit * unit) { // >= 1GB
                sizeText = [NSString stringWithFormat:@"%.1fGB", size / unit / unit / unit];
            } else if (size >= unit * unit) { // >= 1MB
                sizeText = [NSString stringWithFormat:@"%.1fMB", size / unit / unit];
            } else if (size >= unit) { // >= 1KB
                sizeText = [NSString stringWithFormat:@"%.1fKB", size / unit];
            } else { // >= 0B
                sizeText = [NSString stringWithFormat:@"%zdB", size];
            }
            NSString *text = [NSString stringWithFormat:@"%@(%@)", MQDefaultText, sizeText];

            // 回到主线程

            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.textLabel.text = text;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                self.accessoryView = nil;
                //允许点击
                self.userInteractionEnabled = YES;
            }];
        });
    }
    return self;
}
@end
