//
//  CircleBtnViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/23.
//  Copyright © 2016年 Jaly. All rights reserved.
//  环形按钮动画

#import "CircleBtnViewController.h"
#define SUBBUTTONCOUNT 5

@interface CircleBtnViewController ()
@property (weak, nonatomic) UIButton *mainBtn;

@property (weak, nonatomic) UIButton *bgButton;

@property (assign, nonatomic, getter=isUseSpring) BOOL useSpring;

@property (assign, nonatomic) CGRect initRect;

@property (strong, nonatomic) NSMutableArray *subBtns;

@property (strong, nonatomic) NSMutableArray *subBtnColors;
@end

@implementation CircleBtnViewController

- (UIButton *)bgButton {
    if (!_bgButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = self.initRect;
        btn.userInteractionEnabled = NO;
        [btn addTarget:self action:@selector(moveToinitPosition) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        btn.backgroundColor = [UIColor clearColor];
        self.bgButton = btn;
    }
    return _bgButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.useSpring = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.initRect = CGRectMake(10, 100, 40, 40);
    [self bgButton];
    
    UIButton *btn = ({ // main button
        btn = [[UIButton alloc] initWithFrame:self.initRect];
        btn.layer.cornerRadius = 20;
        btn.layer.masksToBounds = YES;
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        self.mainBtn = btn;
        btn;
    });
    
    NSMutableArray *subBtnColors = ({ // sub colors
        subBtnColors = [NSMutableArray array];
        for (int i=0; i<SUBBUTTONCOUNT; i++) {
            [subBtnColors addObject:RandomColor];
        }
        self.subBtnColors = subBtnColors;
        subBtnColors;
    });
    
    NSMutableArray *subBtns = ({  // sub buttons
        subBtns = [NSMutableArray array];
        for (int i=0; i<SUBBUTTONCOUNT; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.layer.cornerRadius = 20;
            btn.layer.masksToBounds = YES;
            btn.frame = self.initRect;
            btn.backgroundColor = self.subBtnColors[i];
            [self.view addSubview:btn];
            [subBtns addObject:btn];
        }
        self.subBtns = subBtns;
        subBtns;
    });
    [self.view bringSubviewToFront:self.mainBtn];
    
    // 弹簧效果按钮
    UISwitch *swh = [[UISwitch alloc] initWithFrame:CGRectMake(120, 100, 180, 40)];
    [swh addTarget:self action:@selector(springOffOrOn) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swh];
}

- (void)springOffOrOn {
    self.useSpring = !self.isUseSpring;
}

- (void)btnClicked:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    CGFloat radius = 100.;
    if (sender.isSelected) {
        [UIView animateWithDuration:1. delay:0. usingSpringWithDamping:self.isUseSpring ? 0.5 : 1. initialSpringVelocity:self.isUseSpring ? 10 : 0 options:UIViewAnimationOptionCurveLinear animations:^{
            CGPoint centerPoint = self.view.center;
            sender.center = centerPoint;
            // sub btn frame
            CGFloat angle = 0;
            for (int i=0; i<SUBBUTTONCOUNT; i++) {
                angle = (M_PI *2 / SUBBUTTONCOUNT) * i + M_PI_2;
                UIButton *btn = self.subBtns[i];
                CGPoint p = CGPointMake(centerPoint.x + radius * cos(angle), centerPoint.y - radius * sin(angle));
                btn.center = p;
            }
        } completion:^(BOOL finished) {
            self.bgButton.userInteractionEnabled = YES;
            self.bgButton.frame = self.view.frame;
        }];
    }else {
        [UIView animateWithDuration:0.5 animations:^{
            sender.center = CGPointMake(30, 120);
            
            for (int i = 0; i<SUBBUTTONCOUNT; i++) {
                UIButton *btn = self.subBtns[i];
                btn.frame = self.initRect;
            }

        } completion:^(BOOL finished) {
            self.bgButton.userInteractionEnabled = NO;
            self.bgButton.frame = self.initRect;
        }];
    }
}


- (void)moveToinitPosition {
    NSLog(@"moveToinitPosition");
}


@end












