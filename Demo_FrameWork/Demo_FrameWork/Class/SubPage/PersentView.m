//
//  PersentView.m
//  Frame_USE
//
//  Created by kfz on 16/6/22.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PersentView.h"

@implementation PersentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGSize selfSize = self.frame.size;
    CGFloat starAngle = - M_PI - M_PI_4;
    CGFloat endAngle = M_PI_4;
    CGFloat radius = MIN(selfSize.width, selfSize.height) / 2. - 15;
    CGPoint point = CGPointMake(selfSize.width/2., radius + 7);
    
    CGFloat lineWidth = 10.;
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:starAngle endAngle:endAngle clockwise:YES];
    [[UIColor colorWithWhite:0.7 alpha:1.] setStroke];
    bgPath.lineCapStyle = kCGLineCapRound;
    bgPath.lineWidth = lineWidth;
    [bgPath stroke];
    
    endAngle = (endAngle - starAngle) * self.value + starAngle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:starAngle endAngle:endAngle clockwise:1];
    [[UIColor redColor] setStroke];
    path.lineCapStyle = kCGLineCapRound;
    path.lineWidth = lineWidth;
    [path stroke];
    
}

- (void)setValue:(CGFloat)value {
    _value = value;
    [self setNeedsDisplay];
}

@end




















