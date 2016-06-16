//
//  DefTabBarViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//  自定义tabBar

#import "DefTabBarViewController.h"
#import "TBButton.h"


@interface DefTabBarViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;

@end

@implementation DefTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.topScrollView.frame = (CGRect){{30, 64}, {SC_WIDTH, 45}};
    [self addTitleButton];
}


/* 添加顶部标题按钮 */
- (void)addTitleButton {
    CGFloat width = 120;
    CGFloat height = 45;
    CGFloat x = 0;
    CGFloat y = 0;
    
    NSInteger i=0;
    for (; i<10; i++) {
        x = i * width;
        NSString *title = [NSString stringWithFormat:@"第%ld个",(long)i];
        TBButton *btn = [TBButton buttonWithType:UIButtonTypeCustom];
//        btn.userInteractionEnabled = NO;
        btn.backgroundColor = RandomColor;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.showsTouchWhenHighlighted = NO;
        btn.frame = (CGRect){{x, y}, {width, height}};
        [self.topScrollView addSubview:btn];
    }
    self.topScrollView.contentSize = (CGSize){i * width, 0};
}



@end























