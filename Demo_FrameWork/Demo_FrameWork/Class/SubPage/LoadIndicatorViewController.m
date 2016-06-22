//
//  LoadIndicatorViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/22.
//  Copyright © 2016年 Jaly. All rights reserved.
//  ❤️型加载指示器

#import "LoadIndicatorViewController.h"
#import "LoadView.h"


@interface LoadIndicatorViewController ()
@property (weak, nonatomic) LoadView *idcView;

@property (weak, nonatomic) UISlider *slider;
@end

@implementation LoadIndicatorViewController

- (UISlider *)slider {
    if (!_slider) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(40, 300, 200, 5)];
        slider.minimumValue = 0.;
        slider.maximumValue = 1.;
        slider.value = 0.;
        [self.view addSubview:slider];
        _slider = slider;
    }
    return _slider;
}
- (LoadView *)idcView {
    if (!_idcView) {
        LoadView *view = [[LoadView alloc] initWithFrame:CGRectMake(40, 100, 150, 260)];
        [self.view addSubview:view];
        _idcView = view;
    }
    return _idcView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self idcView];
    [self slider];
    
    [self.slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISlider *)sender {
    self.idcView.value = sender.value;
}





@end
























