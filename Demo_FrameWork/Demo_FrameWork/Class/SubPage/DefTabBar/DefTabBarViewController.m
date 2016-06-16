//
//  DefTabBarViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//  自定义tabBar

#import "DefTabBarViewController.h"
#import "TBButton.h"
#define N 6

@interface DefTabBarViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) TBButton *selectedButton;

@property (weak, nonatomic) IBOutlet UIButton *indBar;


@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@end


@implementation DefTabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.topScrollView.frame = (CGRect){{0, 0}, {SC_WIDTH, 45}};
    self.topScrollView.showsHorizontalScrollIndicator = NO;
    self.topScrollView.showsVerticalScrollIndicator = NO;
    
    
    self.contentScrollView.frame = (CGRect){{0,  45}, {SC_WIDTH, SC_HEIGHT - 45}};
    self.contentScrollView.backgroundColor = [UIColor greenColor];
    self.contentScrollView.delegate = self;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    
    
    /* 添加顶部标题按钮 */
    [self addTitleButton];
    /** 添加子控制器 */
    [self initViewController];
}

/** 添加子控制器 */
- (void)initViewController {
    CGSize size = self.contentScrollView.bounds.size;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i=0; i<N; i++) {
        x = i*size.width;
        UIViewController *vc = [[UIViewController alloc] init];
        [self addChildViewController:vc];
        vc.view.backgroundColor = RandomColor;
        [self.contentScrollView addSubview:vc.view];
        vc.view.frame = (CGRect) {{x, y}, size};
    }
    self.contentScrollView.contentSize = CGSizeMake(N * size.width, size.height);
    self.contentScrollView.pagingEnabled = YES;
    
}

/* 添加顶部标题按钮 */
- (void)addTitleButton {
    CGFloat width = 120;
    CGFloat height = 45;
    CGFloat x = 0;
    CGFloat y = 0;
    
    NSInteger i=0;
    for (; i<N; i++) {
        x = i * width;
        NSString *title = [NSString stringWithFormat:@"第%ld个",(long)i];
        TBButton *btn = [TBButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            self.selectedButton = btn;
            btn.selected = YES;
        }
//        btn.userInteractionEnabled = NO;
        btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.showsTouchWhenHighlighted = NO;
        btn.frame = (CGRect){{x, y}, {width, height}};
        [self.topScrollView addSubview:btn];
    }
    self.topScrollView.contentSize = (CGSize){i * width, height};
    self.topScrollView.backgroundColor = [UIColor whiteColor];
    // 滑动指示条
    [self.topScrollView addSubview:self.indBar];
    self.indBar.frame = (CGRect){{0, height - 5}, {width, 5}};
    [self.topScrollView bringSubviewToFront:self.indBar];
}

- (void)titleButtonClicked:(TBButton *)btn {
    self.selectedButton.selected = NO;
    self.selectedButton = btn;
    self.selectedButton.selected = YES;
    
    CGRect rect = (CGRect){{btn.tag * SC_WIDTH, 0}, self.contentScrollView.bounds.size};
    
    [self.contentScrollView scrollRectToVisible:rect animated:YES];
//    // indBar
//    rect = self.indBar.frame;
//    rect.origin.x = btn.tag * rect.size.width;
//    self.indBar.frame = rect;
    /** topScrollView自动居中 */
    [self topScrollViewAliginCenter:btn.tag];
}

#pragma -mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger page = offSetX / scrollView.bounds.size.width;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger page = offSetX / scrollView.bounds.size.width;
    // 更新顶部
    self.selectedButton.selected = NO;
    TBButton *btn = self.topScrollView.subviews[page];
    self.selectedButton = btn;
    self.selectedButton.selected = YES;
    
    /** 指示条、topScrollView自动居中 */
    [self topScrollViewAliginCenter:page];
}

/** topScrollView自动居中 */
- (void)topScrollViewAliginCenter:(NSInteger)page {
    // indBar
    CGRect rect = self.indBar.frame;
    rect.origin.x = rect.size.width * page;
    
    [UIView animateWithDuration:0.28 animations:^{
        self.indBar.frame = rect;
    }];
    // 顶部 scrollView 居中
    UIView *v = self.topScrollView.subviews[page];
    //    NSLog(@"%@",NSStringFromClass([v class]));
    rect = v.frame;
    CGFloat boderDistance = (self.topScrollView.frame.size.width - rect.size.width) / 2. ;
    if (rect.origin.x >= boderDistance && (self.topScrollView.contentSize.width - CGRectGetMaxX(rect) )>= boderDistance ) {
        // 可以居中
        rect.origin.x -= boderDistance;
        
        [UIView animateWithDuration:0.26 animations:^{
            self.topScrollView.contentOffset = rect.origin;
        }];
    } else if ( rect.origin.x < boderDistance ) { // scrollView左侧
        CGRect frame = self.topScrollView.subviews[0].frame;
        [self.topScrollView scrollRectToVisible:frame animated:YES];
    } else if ( (self.topScrollView.contentSize.width - CGRectGetMaxX(rect) ) < boderDistance ) { // scrollView右侧
        CGRect frame = self.topScrollView.subviews[N-1].frame;
        [self.topScrollView scrollRectToVisible:frame animated:YES];
    }
}


@end























