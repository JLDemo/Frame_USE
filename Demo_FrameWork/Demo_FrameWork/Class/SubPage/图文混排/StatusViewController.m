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

@property (weak, nonatomic) IBOutlet UIWebView *webView;
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
    NSString *str = @"<p>this is page</p><a href='http://example.com'>Link</a>搜索请点击   <a href='http://www.baidu.com'>百度</a>";
    
    NSString *str2 = @"<img class=\"kfz_mesageImage\" title=\"\\U70b9\\U51fb\\U770b\\U5927\\U56fe\"  onerror=\"picError\\U00b7call(this);\"  bigSrc=\"http://www.kfzimg.com/M00/3,03a5143a2f5646?.jpg\" src=\"http://www.kfzimg.com/M00/7,03a513fde3ad9c?.jpg\" />";
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:str];

    self.rcLabel.componentsAndPlainText = componentsDS;
    self.rcLabel.delegate = self;
    NSLog(@"%@",self.rcLabel.visibleText);
    // webView
    [self.webView loadHTMLString:str baseURL:nil];
}

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSString*)url {
    NSLog(@"%@",url);
    
}



@end






















