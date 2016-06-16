//
//  RootTabBarViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tabBar.backgroundColor = [UIColor cyanColor];
    [self initViewController];
    self.view.backgroundColor = [UIColor greenColor];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViewController {
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    vc1.yp_tabItemTitle = @"主页";
    vc1.yp_tabItemImage = [UIImage imageNamed:@"tab_discover_normal"];
    vc1.yp_tabItemSelectedImage = [UIImage imageNamed:@"tab_discover_selected"];
    
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    vc2.yp_tabItemTitle = @"好友";
    vc2.yp_tabItemImage = [UIImage imageNamed:@"tab_message_normal"];
    vc2.yp_tabItemSelectedImage = [UIImage imageNamed:@"tab_message_selected"];
    
    ThirdViewController *vc3 = [[ThirdViewController alloc] init];
    vc3.yp_tabItemTitle = @"广场";
    vc3.yp_tabItemImage = [UIImage imageNamed:@"tab_message_normal"];
    vc3.yp_tabItemSelectedImage = [UIImage imageNamed:@"tab_message_selected"];
    
    FourViewController *vc4 = [[FourViewController alloc] init];
    vc4.yp_tabItemTitle = @"我的";
    vc4.yp_tabItemImage = [UIImage imageNamed:@"tab_me_normal"];
    vc4.yp_tabItemSelectedImage = [UIImage imageNamed:@"tab_me_selected"];
    
    self.viewControllers = @[vc1, vc2, vc3, vc4];

}

@end






















