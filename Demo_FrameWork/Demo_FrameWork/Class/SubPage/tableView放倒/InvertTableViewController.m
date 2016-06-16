//
//  InvertTableViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "InvertTableViewController.h"
#import "JLTVCell.h"

@interface InvertTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation InvertTableViewController
static NSString *cellID = @"string_cell_id";

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tv = [[UITableView alloc] init];
        [self.view addSubview:tv];
        
        CGFloat width = SC_WIDTH;
        CGFloat height = width * (9./15.);
        
        CGFloat x = ( width - height )/2.;
        CGFloat y =  ( height - width )/2.;
        tv.frame = (CGRect){{x, y}, {height, width}};
        tv.center = (CGPoint){width/2., height/2. };
        
        
        
        _tableView = tv;
    }
    return _tableView;
}
- (NSMutableArray *)dataSource {
    if ( !_dataSource ) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:@(4)];
        [_dataSource addObject:@(1)];
        [_dataSource addObject:@(2)];
        [_dataSource addObject:@(3)];
        [_dataSource addObject:@(4)];
        [_dataSource addObject:@(1)];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    // 将tableView放倒
    
    self.tableView.transform = CGAffineTransformRotate(self.tableView.transform, -M_PI_2);
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SC_WIDTH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JLTVCell *cell = [JLTVCell tvCellWithTableView:tableView];
    
    cell.i = [self.dataSource[indexPath.row] integerValue];
    
    return cell;
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
