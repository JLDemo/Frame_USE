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
    [self addItemTitle:@"Realm数据库" class:@"RealmViewController"];
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
    [self addItemTitle:@"环形按钮" class:@"CircleBtnViewController"]; // CircleBtnViewController
    
    
    
//    Class class = NSClassFromString(@"CircleBtnViewController");
//    UIViewController *vc = [[class alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
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
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = NSClassFromString(self.classArray[indexPath.row]);
    UIViewController *vc = [[class alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
