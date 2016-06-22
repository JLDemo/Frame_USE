//
//  ScoreViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/21.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "ScoreViewController.h"
#import "ScoreView.h"

@interface ScoreViewController ()
@property (weak, nonatomic) ScoreView *scoreView;
@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scoreView.bgColor = [UIColor colorWithWhite:0.85 alpha:1.];
    self.scoreView.starColor = [UIColor yellowColor];
}

- (ScoreView *)scoreView {
    if (!_scoreView) {
        ScoreView *view = [[ScoreView alloc] initWithFrame:CGRectMake(20, 120, 300, 50)];
        [self.view addSubview:view];
        _scoreView = view;
    }
    return _scoreView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger score = arc4random() % 11;
    self.scoreView.score = score;
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
