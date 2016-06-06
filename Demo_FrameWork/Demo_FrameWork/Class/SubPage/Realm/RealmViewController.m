//
//  RealmViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "RealmViewController.h"
#import <Realm/Realm.h>
#import "ExtensionViewController.h"
#import "RealmTableViewController.h"



@interface Person : RLMObject
@property NSString *name;

@end

@implementation Person
@end


@interface Dog : RLMObject

@property NSString *name;
@property NSInteger age;
@property Person *owner;

@end
@implementation Dog

@end

@interface RealmViewController ()

@end

@implementation RealmViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    return [super initWithNibName:nibNameOrNil bundle:nibNameOrNil];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //
    
}

- (void)one2one {
    Person *p = [[Person alloc] init];
    p.name = @"liden";
    Dog *d = [[Dog alloc] init];
    d.name = @"wang";
    d.owner = p;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    // save
    [realm beginWriteTransaction];
    [realm addObject:d];
    [realm commitWriteTransaction];
    
    // query
    RLMResults *result = [Person objectsInRealm:realm where:@"p contains 'li'"];
    NSLog(@"%ld",result.count);
}

- (IBAction)extension:(id)sender {
    ExtensionViewController *extension = [[ExtensionViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:extension animated:YES];
}

- (IBAction)tableViewContoller:(id)sender {  // RealmTableViewController
    RealmTableViewController *vc = [[RealmTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}




//
//- (void)backLine {
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    
//    [realm transactionWithBlock:^{
//        [Person createInRealm:realm withValue:@[@"person_name", @[ @[@"dog_name", @12] ]] ];
//        [Person createInRealm:realm withValue:@[@"aclien", @[ @[@"wang", @10] ]] ];
//    }];
//    
//    // Log all dogs and their owners using the "owners" inverse relationship
//    RLMResults *allDogs = [Dog allObjects];
//    for (Dog *dog in allDogs) {
////        NSArray *ownerNames = [dog.owners valueForKeyPath:@"name"];
////        NSLog(@"%@ has %lu owners (%@)", dog.name, (unsigned long)ownerNames.count, ownerNames);
//    }
//}
//
//- (void)simple {
//    //ni
//    Dog *dog = [[Dog alloc] init];
//    dog.name = @"DDD";
//    dog.age = 12;
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    // save
//    [realm beginWriteTransaction];
//    [realm addObject:dog];
//    [realm commitWriteTransaction];
//    // query
//    RLMResults *result = [Dog objectsInRealm:realm where:@"name contains 'D'"];
//    NSLog(@"name contains count:%lu",(unsigned long)result.count);
//    
//    RLMResults *result2 = [result objectsWhere:@"age > 8"];
//    NSLog(@"name contains count:%lu",(unsigned long)result2.count);
//    // Link objects
//    Person *p = [[Person alloc] init];
//    p.name = @"li";
////    [p.dogs addObject:dog];
//    
//    [realm beginWriteTransaction];
//    [realm addObject:p];
//    [realm commitWriteTransaction];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        RLMRealm *otherRealm = [RLMRealm defaultRealm];
//        RLMResults *otherResults = [Dog objectsInRealm:otherRealm where:@"name contains 'D'"];
//        NSLog(@"dispathc asys contain dog:%ld",otherResults.count);
//    });
//}
//
//




@end



















