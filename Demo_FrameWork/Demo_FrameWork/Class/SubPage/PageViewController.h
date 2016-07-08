//
//  PageViewController.h
//  Frame_USE
//
//  Created by kfz on 16/7/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController

@property (assign, nonatomic) NSUInteger pageIndex;

@property (copy, nonatomic) NSString *titleText;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end
