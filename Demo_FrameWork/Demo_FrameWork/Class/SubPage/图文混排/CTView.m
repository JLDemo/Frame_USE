//
//  CTView.m
//  Frame_USE
//
//  Created by kfz on 16/6/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "CTView.h"
#import <CoreText/CoreText.h>

/** https://www.raywenderlich.com/4147/core-text-tutorial-for-ios-making-a-magazine-app */
@implementation CTView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self helloWorld_Test];
    
}

- (void)helloWorld_Test {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"hello world"];
    [str addAttributes:@{
                         NSForegroundColorAttributeName : [UIColor redColor],
                         NSFontAttributeName : [UIFont systemFontOfSize:20]
                         }range:NSMakeRange(0, @"hello".length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)str);
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, str.length), path, NULL);
    
    CTFrameDraw(frame, context);
    
    CFRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
}

- (void)helloWorld {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds );
    
    NSAttributedString* attString = [[NSAttributedString alloc]
                                     initWithString:@"Hello core text world!"]; //2
    
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    CTFrameDraw(frame, context); //4
    
    CFRelease(frame); //5
    CFRelease(path);
    CFRelease(framesetter);

}


@end






