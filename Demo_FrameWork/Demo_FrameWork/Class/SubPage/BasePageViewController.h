//
//  BasePageViewController.h
//  Frame_USE
//
//  Created by kfz on 16/7/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePageViewController : UIViewController

@property(nonatomic,strong) NSArray *pageTitles;

@property(nonatomic,strong) UIPageViewController *pageViewController;

@end
