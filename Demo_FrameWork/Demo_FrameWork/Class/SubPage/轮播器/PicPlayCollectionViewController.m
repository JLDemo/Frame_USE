//
//  PicPlayCollectionViewController.m
//  Frame_USE
//
//  Created by kfz on 16/6/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//  集合视图实现图片轮播

#import "PicPlayCollectionViewController.h"
#import "JLCell.h"
#define PIC_Count 4

@interface PicPlayCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) NSMutableArray *dataSource;

@property (weak, nonatomic) UICollectionView *collectionView;
@end

static NSString *ID = @"coll_pic_play_cell";

@implementation PicPlayCollectionViewController
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        // add header image
        {
            NSString *imageName = [NSString stringWithFormat:@"0_%d",PIC_Count];
            UIImage *image = [UIImage imageNamed:imageName];
            [_dataSource addObject:image];
        }
        
        for (NSInteger i=0; i<PIC_Count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"0_%ld",i+1];
            UIImage *image = [UIImage imageNamed:imageName];
            [_dataSource addObject:image];
        }
        // add footer image
        // add header image
        {
            NSString *imageName = [NSString stringWithFormat:@"0_%d",1];
            UIImage *image = [UIImage imageNamed:imageName];
            [_dataSource addObject:image];
        }
    }
    return _dataSource;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // layout
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = (CGSize){[UIScreen mainScreen].bounds.size.width, 200};
        layout.minimumLineSpacing = 0;
        
        
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 有导航栏时，UIScrollView.contentOffSet.y = -64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[JLCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
//    N  ->1  2 3 ……N 1 默认选择页
    [self showItem:1];
}

#pragma -mark UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JLCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.image = self.dataSource[indexPath.item];
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (page == 0) { // -> PIC_COUNT
        [self showItem:PIC_Count];
    } else if (page == PIC_Count + 1) { // -> 1
        [self showItem:1];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"%s",__func__);
}

- (void)showItem:(NSInteger)item {
    // N  ->1  2 3 ……N 1 默认选择页
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    
}


@end




















