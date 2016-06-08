//
//  DefTabBarViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//  自定义tabBar

#import "DefTabBarViewController.h"

@interface DefTabBarViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;

@end

@implementation DefTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addTitleButton];
}


/* 添加顶部标题按钮 */
- (void)addTitleButton {
    CGFloat width = 120;
    CGFloat height = 45;
    CGFloat x = 0;
    CGFloat y = 0;
    for (NSInteger i=0; i<10; i++) {
        x = i * width;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = RandomColor;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.showsTouchWhenHighlighted = NO;
        btn.frame = (CGRect){{x, y}, {width, height}};
        [self.topScrollView addSubview:btn];
    }
}



@end























