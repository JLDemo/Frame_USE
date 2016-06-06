//
//  ExtensionViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/6.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ExtensionViewController.h"
#import <Realm/Realm.h>
#import "Book.h"

@interface ExtensionViewController ()

@property (weak, nonatomic) UIButton *button;
@property (strong, nonatomic) Book *book;
@property (strong, nonatomic) RLMNotificationToken *notificationToken;
@end

@implementation ExtensionViewController

- (UIButton *)button {
    if (!_button ) {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:bt];
        _button = bt;
        [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bt.backgroundColor = [UIColor cyanColor];
        bt.frame = (CGRect){{100, 40}, {140, 40}};
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
   
    //
    if (!_book) {
       [[RLMRealm defaultRealm] transactionWithBlock:^{
           self.book = [Book createInDefaultRealmWithValue:@[@"", @0]];
       }];
    }
    self.notificationToken = [self.book.realm addNotificationBlock:^(NSString * _Nonnull notification, RLMRealm * _Nonnull realm) {
        if (self.book.count % 5 == 0) {
            [self touch];
        }
        [self updateLabel];
    }];
    
    
}

- (void)updateLabel {
    NSString *title = [NSString stringWithFormat:@"%ld",self.book.count];
    [self.button setTitle:title forState:UIControlStateNormal];
}

- (void)touch {
    [[RLMRealm defaultRealm] transactionWithBlock:^{
        self.book.count ++;
    }];
}

@end




























