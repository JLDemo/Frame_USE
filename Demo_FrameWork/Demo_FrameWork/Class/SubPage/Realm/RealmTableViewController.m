//
//  RealmTableViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "RealmTableViewController.h"
#import <Realm/Realm.h>

@interface TableModel : RLMObject
@property NSString *title;
@property NSDate *date;
@end
@implementation TableModel
@end



@interface RealmTableViewController ()

@property (strong, nonatomic) RLMResults *dataSources;
@property (strong, nonatomic) RLMNotificationToken *notification;

@end

@implementation RealmTableViewController

- (NSMutableArray *)dataSources {
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSources = [TableModel allObjects];
    
    __weak typeof(self) sf = self;
    self.notification = [self.dataSources addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        if (error) {
            NSLog(@"failed to open Realm:%@",error);
            return ;
        }
        
        UITableView *tv = sf.tableView;
        
        if (!change) {
            [tv reloadData];
            return;
        }
        
        [tv beginUpdates];
        [tv insertRowsAtIndexPaths:[change insertionsInSection:0] withRowAnimation:UITableViewRowAnimationTop];
        [tv endUpdates];
        
    }];
    
}
- (void)setUp {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"table_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    TableModel *model = self.dataSources[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.date.description;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


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

- (void)add {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [TableModel createInRealm:realm withValue:@[ [self randomTitle], [self randomDate] ]];
    [realm commitWriteTransaction];
}

- (NSString *)randomTitle {
    return [NSString stringWithFormat:@"%d",arc4random()];
}
- (NSDate *)randomDate {
    return [NSDate dateWithTimeIntervalSince1970:arc4random()];
}

@end

















