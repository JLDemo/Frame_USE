//
//  TestViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/16.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.label != nil) {
        self.label.frame = (CGRect){{12, 200}, {121, 121}};
        
    }else {
        NSLog(@"label is nil");
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
}
- (IBAction)changeFrame:(id)sender {
    self.label.frame = (CGRect){{12, 200}, {121, 121}};
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
