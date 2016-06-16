//
//  MarkupParser.h
//  Frame_USE
//
//  Created by kfz on 16/6/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>


@interface MarkupParser : NSObject

@property (copy, nonatomic) NSString *font;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) UIColor *strokeColor;
@property (assign, nonatomic) float strokeWidth;

@property (strong, nonatomic) NSMutableArray *images;

- (NSAttributedString *)attrStringFromMarkup:(NSString *)html;


@end












