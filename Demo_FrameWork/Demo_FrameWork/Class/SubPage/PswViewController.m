//
//  PswViewController.m
//  Frame_USE
//
//  Created by kfz on 16/7/14.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PswViewController.h"
#import "PSTextField.h"

@interface PswViewController ()
@property (weak, nonatomic) IBOutlet PSTextField *textField1;

@end

@implementation PswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // setUI
    self.textField1.placeholder = @"请输入密码";
    self.textField1.font = [UIFont systemFontOfSize:16];
    self.textField1.keyboardType = UIKeyboardTypeNumberPad;
    self.textField1.textChangeBlock = ^(NSString *text) {
        NSLog(@"%@",text);
    };
    [self.textField1 becomeFirstResponder];
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end



















