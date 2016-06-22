//
//  LoadView.m
//  Frame_USE
//
//  Created by kfz on 16/6/22.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "LoadView.h"

@interface LoadView ()

@property (assign, nonatomic) CGFloat angle;

@end

@implementation LoadView

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        self.backgroundColor = [UIColor colorWithWhite:0.87 alpha:1.];
        [self addTimer];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat heartHeight = 0.;
    CGSize selfSize = self.bounds.size;
    CGFloat offSetAngle = M_PI_4;
    CGFloat radius = MIN(selfSize.width/4., selfSize.height/2.) - 10;
    
    CGPoint leftPoint = CGPointMake(selfSize.width/2. - radius, radius);
    CGPoint rightPoint = CGPointMake(selfSize.width/2. + radius, radius);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:rightPoint radius:radius startAngle:-M_PI endAngle:offSetAngle clockwise:1];
    heartHeight = radius + radius * ((M_PI - offSetAngle));
    [path addLineToPoint:CGPointMake(selfSize.width/2., heartHeight)];
    [path addArcWithCenter:leftPoint radius:radius startAngle:-(M_PI+offSetAngle) endAngle:0 clockwise:1];
    
    [path setLineWidth:2.];
    [path addClip];
    [path stroke];
    
    // 波浪线
    CGFloat r = -1;
    CGPoint starPoint = CGPointMake(0, heartHeight + r - heartHeight * self.value);
    UIBezierPath *wave = [UIBezierPath bezierPath];
    [wave moveToPoint:starPoint];
    for (int i=1; i<selfSize.width; i+=5) {
        [wave addLineToPoint:[self pointWithCurrentPoint:starPoint index:i range:r]];
    }
    [wave addLineToPoint:CGPointMake(selfSize.width, selfSize.height)];
    [wave addLineToPoint:CGPointMake(0, selfSize.height)];
    [wave addLineToPoint:starPoint];
    [[UIColor redColor] set];
    
    [wave fill];
    
}

- (CGPoint)pointWithCurrentPoint:(CGPoint)starPoint index:(int)i range:(CGFloat)r {
    CGPoint point = CGPointMake(1, 1);
    point.x = starPoint.x + i;
    point.y = starPoint.y + 3 * (sin(M_PI * i/50 + self.angle));
    return point;
}

- (void)addTimer {
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveWave) userInfo:nil repeats:YES];
}

- (void)moveWave {
    self.angle += M_PI *0.02;;
    if (self.angle == M_PI *2) {
        self.angle = 0;
    }
    [self setNeedsDisplay];
}


@end
























