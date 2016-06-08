//
//  YYTextViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/7.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "YYTextViewController.h"
#import "YYKit.h"

#define  SYS_VERSION [UIDevice systemVersion]
#define  sVersion7Later (SYS_VERSION>=7)

@interface YYTextViewController ()

@end

@implementation YYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"test"];
        one.font = [UIFont boldSystemFontOfSize:14];
        one.color = [UIColor orangeColor];
        [attStr appendAttributedString:one];
        [attStr appendAttributedString:[self appendString]];
    }
    
    {
        NSString *str = @"link test";
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:str];
        one.font = [UIFont boldSystemFontOfSize:20];
        one.color = [UIColor greenColor];
        NSRange range = [str rangeOfString:@"link"];
        [one setTextHighlightRange:range color:[UIColor yellowColor] backgroundColor:[UIColor whiteColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [self showMessage:[text.string substringWithRange:range]];
        }];
        
        
        [attStr appendAttributedString:one];
        [attStr appendAttributedString:[self appendString]];
    }
    
    CGSize size = self.view.frame.size;
    YYLabel *label = [[YYLabel alloc] initWithFrame:(CGRect){{0, 0}, size}];
    label.numberOfLines = 0;
    label.attributedText = attStr;
    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    //
//    label.text = @"";
//    label.font = nil;
}

- (NSMutableAttributedString *)appendString {
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    one.font = [UIFont systemFontOfSize:4];
    return one;
}
                  
                  
- (void)alertMessage:(NSString *)str {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:str delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)showMessage:(NSString *)msg {
    CGSize size = self.view.frame.size;
    YYLabel *label = [[YYLabel alloc] init];
    label.width = size.width;
    label.height = 50;
    label.backgroundColor = [UIColor greenColor];
    label.bottom = 0;
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.top = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
    
    /*
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2 * padding;
    
    label.bottom = 0;
    [self.view addSubview:label];
    [UIView animateWithDuration:0.3 animations:^{
        label.top = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
 */
}




@end






















