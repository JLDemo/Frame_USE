//
//  BasePageViewController.m
//  Frame_USE
//
//  Created by kfz on 16/7/8.
//  Copyright © 2016年 Jaly. All rights reserved.
//

#import "BasePageViewController.h"
#import "PageViewController.h"

@interface BasePageViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@end

@implementation BasePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.pageTitles = @[@"111", @"2222", @"33333", @"4444"];
    
    NSDictionary *options = @{
                              UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationMin)
                              };
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageViewController.view.frame = [UIScreen mainScreen].bounds;
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageViewController *initVC = [self vidwControllerAtIndex:0];
    [self.pageViewController setViewControllers:@[initVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

-(PageViewController *)vidwControllerAtIndex:(NSUInteger)index

{
    if (self.pageTitles.count==0 || index>=self.pageTitles.count) {
        return nil;
    }
    PageViewController *pageContentViewController = [[PageViewController alloc] init];
    pageContentViewController.view.frame = [UIScreen mainScreen].bounds;
    pageContentViewController.view.backgroundColor = [UIColor lightGrayColor];
    
    pageContentViewController.titleLabel.text = self.pageTitles[index];
    
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - PageViewControllerDataSource

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController

{
    
    NSUInteger index = ((PageViewController *)viewController).pageIndex;
    
    
    
    if (index==0||index==NSNotFound) {
        
        return nil;
        
    }
    
    index--;
    return [self vidwControllerAtIndex:index];
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController

{
    NSUInteger index =((PageViewController *)viewController).pageIndex;
    if (index==NSNotFound) {
        return nil;
    }
    index++;
    if (index==[self.pageTitles count]) {
        return nil;
    }
    return [self vidwControllerAtIndex:index];
    
}
//显示点的数量

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController

{
    
    return [self.pageTitles count];
    
}

//初始化选择哪一页

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController

{
    
    return 0;
    
    
    
}


@end












