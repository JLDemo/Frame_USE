//
//  MainTableViewController.m
//  Demo_FrameWork
//
//  Created by kfz on 16/6/2.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "MainTableViewController.h"



@interface MainTableViewController ()

@property (strong, nonatomic) NSMutableArray *titleArray;
@property (strong, nonatomic) NSMutableArray *classArray;

@end

@implementation MainTableViewController

- (NSMutableArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

- (NSMutableArray *)classArray {
    if (!_classArray) {
        _classArray = [NSMutableArray array];
    }
    return _classArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES];
    [self addItemTitle:@"JSQMessagesVeiwController" class:@"BaseChatViewController"];
    [self addItemTitle:@"YYKit框架测试" class:@"YYKitViewController"];  //
    [self addItemTitle:@"UIScrollView-图片轮播器" class:@"PicPlayViewController"];  //
    [self addItemTitle:@"UICollectionView-图片轮播器" class:@"PicPlayCollectionViewController"];  // 
    [self addItemTitle:@"自定义网易TabBar" class:@"DefTabBarViewController"];  //
    [self addItemTitle:@"第三方  tabBar " class:@"RootTabBarViewController"];  //
    [self addItemTitle:@"图文混排:html方式+CoreText" class:@"StatusViewController"];  //
    [self addItemTitle:@"tableView放倒" class:@"InvertTableViewController"];  //
    [self addItemTitle:@"button 球形效果" class:@"BTViewController"];  //
    [self addItemTitle:@"TestViewController" class:@"TestViewController"];  //
    [self addItemTitle:@"星级评价" class:@"ScoreViewController"];  // ScoreViewController
    [self addItemTitle:@"❤️型/环形百分比,加载指示器" class:@"LoadIndicatorViewController"]; //
    [self addItemTitle:@"环形按钮" class:@"CircleBtnViewController"]; //
    [self addItemTitle:@"下载字体" class:@"DowFamiViewController"]; //
    [self addItemTitle:@"PageViewController" class:@"BasePageViewController"]; //  PageViewController
    
    
    
    Class class = NSClassFromString(@"BasePageViewController");
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    NSArray <NSString *>*array = [UIFont familyNames];
//    for (NSString *name in array) {
//        NSLog(@"%@",name);
//    }
    
}

- (void)addItemTitle:(NSString *)title class:(NSString *)class {
    [self.titleArray addObject:title];
    [self.classArray addObject:class];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ceell_dji";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Microsoft YaHei" size:16];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString(self.classArray[indexPath.row]);
    UIViewController *vc = [[class alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}



@end
