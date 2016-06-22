//
//  ScoreView.m
//  Frame_USE
//
//  Created by kfz on 16/6/21.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ScoreView.h"

@interface ScoreView ()

@property (weak, nonatomic) CAShapeLayer *backGroundLayer;

@end

@implementation ScoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawStar];
//        [self addRedLayer];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self drawStar];
}

- (void)addRedLayer {
    CAShapeLayer *redLayer = [CAShapeLayer layer];
    redLayer.lineWidth = 1.2;
    [self.layer addSublayer:redLayer];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, self.bounds);
    CGPathAddRect(path, nil, CGRectMake(20, 10, 30, 30));
    
    redLayer.path = path;
//    redLayer.fillRule = kCAFillRuleEvenOdd;
    redLayer.fillColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:redLayer];
}

- (void)drawStar {
    self.backgroundColor = [UIColor whiteColor];
    CGSize size = self.frame.size;
    CGFloat partWidth = size.width / self.count;
    CGFloat partHeight = size.height;
    CGFloat radius = size.height/2.; // 半径
    CGFloat angle = 4. * M_PI / 5.;
    
    // 画进度
    UIBezierPath *bgPath = [UIBezierPath bezierPath];
    [bgPath moveToPoint:CGPointMake(0, size.height/2.)];
    [bgPath addLineToPoint:CGPointMake(size.width, size.height/2)];
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.path = bgPath.CGPath;
    bgLayer.strokeColor = [UIColor orangeColor].CGColor;

    bgLayer.fillColor = [UIColor orangeColor].CGColor;
    bgLayer.lineWidth = size.height;
    [self.layer addSublayer:bgLayer];
    self.backGroundLayer = bgLayer;
    
    
    
    // 画五角星
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    for (NSUInteger i=0; i<self.count; i++) {
        CGPoint startPoint = CGPointMake(i * partWidth + partWidth/2., 0);
        CGPoint centerPoint = CGPointMake(startPoint.x, partHeight/2.);
        [starPath moveToPoint:startPoint];
        // 拉线画五角星
        for (NSUInteger j=1; j<=5; j++) {
            CGFloat ang = M_PI_2 + j * angle;
            CGPoint p ;
            p.x = centerPoint.x + radius * cos(ang);
            p.y = centerPoint.y - radius * sin(ang);
            [starPath addLineToPoint:p];
        }
        
    }

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = starPath.CGPath;
    self.layer.mask = layer;
    
}

- (NSUInteger)count {
    if (_count == 0) {
        return 5;
    }
    return _count;
}

- (void)setBgColor:(UIColor *)bgColor {
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

- (void)setStarColor:(UIColor *)starColor {
    _starColor = starColor;
    self.backGroundLayer.strokeColor = starColor.CGColor;
    self.backGroundLayer.fillColor = starColor.CGColor;
}

- (void)setScore:(NSUInteger)score {
    _score = score;
    self.backGroundLayer.strokeEnd = score / 10.;
}

@end





















