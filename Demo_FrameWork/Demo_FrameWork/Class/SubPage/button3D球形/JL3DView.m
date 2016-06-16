//
//  JL3DView.m
//  Frame_USE
//
//  Created by kfz on 16/6/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "JL3DView.h"

@interface JL3DView ()

@property (weak, nonatomic) UIButton *btn;

@end


@implementation JL3DView

- (UIButton *)btn {
    if (!_btn ) {
        UIButton *btn = [[UIButton alloc] initWithFrame:(CGRect){{10, 10}, {100, 40}}];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn setTitle:@"OK" forState:UIControlStateNormal];
        [self addSubview:btn];
        _btn = btn;
    }
    return _btn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self btn];
        self.btn.layer.zPosition = 0.6;
        self.btn.alpha = 0.6;
    }
    return self;
}


@end

















