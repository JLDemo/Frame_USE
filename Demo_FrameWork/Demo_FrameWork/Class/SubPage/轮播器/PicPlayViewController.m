//
//  PicPlayViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/7.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "PicPlayViewController.h"
#define PIC_COUNT 4

@interface PicPlayViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *imageArray;


@end

@implementation PicPlayViewController

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
        //
        for ( int i=0; i<PIC_COUNT; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%d",i];
            UIImage  *image = [UIImage imageNamed:imageName];
            [_imageArray addObject:image];
        }
    }
    return _imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addImage];
    
    self.scrollView.delegate = self;
//    NSLog(@"%f",self.scrollView.contentInset.top);
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)addImage {
    // set scrollView
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    CGSize size = self.scrollView.bounds.size;
    
    [self addHeaderImageVeiw];
    [self addFooterImageVeiw];
    
    for (NSInteger i=1; i<=self.imageArray.count; i++) {
        CGRect rect = (CGRect){{size.width * i, 0}, size};
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:rect];
        imgView.image = self.imageArray[i-1];
        [self.scrollView addSubview:imgView];
    }
    
    self.scrollView.contentSize = (CGSize){size.width * (PIC_COUNT +2), 0};
    self.scrollView.contentOffset = (CGPoint){size.width, 0};
}
- (void)addHeaderImageVeiw {
    CGSize size = self.scrollView.bounds.size;
    CGRect rect = (CGRect){{0, 0}, size};
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:rect];
    imgView.image = self.imageArray[PIC_COUNT - 1];
    [self.scrollView addSubview:imgView];
}
- (void)addFooterImageVeiw {
    CGSize size = self.scrollView.bounds.size;
    CGRect rect = (CGRect){{(PIC_COUNT +1)*size.width, 0}, size};
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:rect];
    imgView.image = self.imageArray[0];
    [self.scrollView addSubview:imgView];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@",NSStringFromCGPoint(self.scrollView.contentOffset));
    CGPoint offSet = scrollView.contentOffset;
    CGSize size = scrollView.frame.size;
    NSInteger page = (scrollView.contentOffset.x+1) / size.width;
//    NSLog(@"%ld",(long)page);
    if ( page == 0 ) {
        CGFloat x = size.width * PIC_COUNT;
        offSet.x =  x;
        self.scrollView.contentOffset = offSet;
    }else if (page == PIC_COUNT + 1) {
        CGFloat x = size.width ;
        offSet.x = x;
        self.scrollView.contentOffset = offSet;
    }
}

@end
















