//
//  BTViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/15.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BTViewController.h"
#import "JL3DView.h"

@interface BTViewController ()

@property (weak, nonatomic) JL3DView *subView;

@end

@implementation BTViewController

- (JL3DView *)subView {
    if (!_subView) {
        JL3DView *sv = [[JL3DView alloc] initWithFrame:(CGRect){{0, 100}, {SC_WIDTH, SC_WIDTH}}];
        [self.view addSubview:sv];
        _subView = sv;
    }
    return _subView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.subView.backgroundColor = [UIColor blackColor];
}


@end




















