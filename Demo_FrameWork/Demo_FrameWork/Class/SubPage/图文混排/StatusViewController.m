//
//  StatusViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/13.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "StatusViewController.h"
#import "RCLabel.h"
#import "CTView.h"


@interface StatusViewController ()<RTLabelDelegate>
@property (weak, nonatomic) RCLabel *rcLabel;

@property (weak, nonatomic) IBOutlet CTView *ctView;

@end

@implementation StatusViewController


- (RCLabel *)rcLabel {
    if (!_rcLabel) {
        RCLabel *label = [[RCLabel alloc]initWithFrame:(CGRect){{0, 64}, {SC_WIDTH, 80}}];
        [self.view addSubview:label];
        _rcLabel = label;
    }
    return _rcLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:@"<p>this is page</p><a href='http://example.com'>Link</a>搜索请点击   <a href='http://www.baidu.com'>百度</a>"];

    self.rcLabel.componentsAndPlainText = componentsDS;
    self.rcLabel.delegate = self;
    NSLog(@"%@",self.rcLabel.visibleText);
}

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSString*)url {
    NSLog(@"%@",url);
    
}



@end






















