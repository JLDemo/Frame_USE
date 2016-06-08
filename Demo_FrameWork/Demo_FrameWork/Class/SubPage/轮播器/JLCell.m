//
//  JLCell.m
//  Frame_USE
//
//  Created by kfz on 16/6/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "JLCell.h"


@interface JLCell ()

@property (weak, nonatomic) UIImageView *imageView;

@end


@implementation JLCell
- (UIImageView *)imageView {
    if (!_imageView ) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        _imageView = imageView;
        _imageView.frame = self.contentView.frame;
    }
    return _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        [self imageView];
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

@end
