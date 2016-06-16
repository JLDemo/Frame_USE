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
    }
    return self;
}



@end
