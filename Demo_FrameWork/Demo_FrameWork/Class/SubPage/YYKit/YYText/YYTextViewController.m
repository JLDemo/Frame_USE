//
//  YYTextViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/7.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "YYTextViewController.h"
#import "YYKit.h"

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
            [self alertMessage:[text.string substringWithRange:range]];
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
    label.text = @"";
    label.font = nil;
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




@end






















