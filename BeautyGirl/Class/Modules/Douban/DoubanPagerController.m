//
//  DoubanPagerController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "DoubanPagerController.h"
#import "DoubanViewController.h"

@interface DoubanPagerController () <TYTabPagerControllerDataSource,TYTabPagerControllerDelegate>
{
    
    
}

@property (strong,nonatomic) NSArray *titleArray;
@property (strong,nonatomic) NSArray *idArray;


@end

@implementation DoubanPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self preparePagerSetting];
    

    self.titleArray = @[@"大胸妹", @"小翘臀",@ "黑丝袜", @"美图控",@"高颜值",@"大杂烩"];
    
    self.idArray = @[@(2),@(6),@(7),@(3),@(4),@(5)];
    
    [self reloadData];
}

-(void)preparePagerSetting {
    CGRect r = self.navigationController.navigationBar.frame;
    self.tabBarOrignY = r.size.height + r.origin.y;
    
    self.tabBarHeight = 50;
    self.tabBar.layout.barStyle = TYPagerBarStyleProgressView;
    //    self.tabBar.layout.cellWidth = CGRectGetWidth(self.view.frame)/3;
    self.tabBar.layout.cellSpacing = 0;
    self.tabBar.layout.cellEdging = 0;
    self.tabBar.layout.adjustContentCellsCenter = YES;
    self.dataSource = self;
    self.delegate = self;
}

#pragma mark - TYTabPagerControllerDataSource

- (NSInteger)numberOfControllersInTabPagerController {
    return self.titleArray.count;
}

- (UIViewController *)tabPagerController:(TYTabPagerController *)tabPagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    
    DoubanViewController *controller = [DoubanViewController new];
    controller.cID = [self.idArray[index] integerValue];
    
    return controller;
}

- (NSString *)tabPagerController:(TYTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = self.titleArray[index];
    return title;
}

- (void)tabPagerController:(TYTabPagerController *)tabPagerController willDisplayCell:(UICollectionViewCell<TYTabPagerBarCellProtocol> *)cell atIndex:(NSInteger)index {
    
    self.title = self.titleArray[index];
    
}



@end
