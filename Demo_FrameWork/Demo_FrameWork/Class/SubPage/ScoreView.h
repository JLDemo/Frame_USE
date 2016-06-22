//
//  ScoreView.h
//  Frame_USE
//
//  Created by kfz on 16/6/21.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreView : UIView
/**
 * 星星数量,默认5个
 */
@property (assign, nonatomic) NSUInteger count;

/**
 * view的背景色
 */
@property (strong, nonatomic) UIColor *bgColor;

/**
 * star的填充色
 */
@property (strong, nonatomic) UIColor *starColor;

/**
 * 当前分数[0, 10]
 */
@property (assign, nonatomic) NSUInteger score;
@end
