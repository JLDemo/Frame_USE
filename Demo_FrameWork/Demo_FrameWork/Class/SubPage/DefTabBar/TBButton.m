//
//  TBButton.m
//  Frame_USE
//
//  Created by kfz on 16/6/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "TBButton.h"

@implementation TBButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
        // font
        [self.titleLabel setFont:NORMAL_FONT];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    CGFloat normalFontSize = NORMAL_FONT.pointSize;
    CGFloat selectedFontSize = SESECTED_FONT.pointSize;
    // r 为放缩因子 scale*r
    CGFloat r = ( selectedFontSize - normalFontSize ) / 17;
    
    CGFloat scale = 1 + r;
    if (selected == NO) {
        scale = 1;
    }

    self.transform = CGAffineTransformMakeScale(scale, scale);
}



@end
