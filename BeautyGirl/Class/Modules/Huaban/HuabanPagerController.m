//
//  HuabanPagerController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "HuabanPagerController.h"
#import "HuabanViewController.h"
@interface HuabanPagerController() <TYTabPagerControllerDataSource,TYTabPagerControllerDelegate>
{
    
    
}

@property (strong,nonatomic) NSArray *titleArray;
@property (strong,nonatomic) NSArray *idArray;

@end

@implementation HuabanPagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self preparePagerSetting];
    self.titleArray = @[@"大胸妹", @"小清新", @"文艺范", @"性感妹", @"大长腿", @"黑丝袜", @"小翘臀"];
    
    self.idArray = @[@(34),@(35),@(36),@(37),@(38),@(39),@(40)];
    
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
   
    HuabanViewController *controller = [HuabanViewController new];
    controller.cID = [self.idArray[index] integerValue];
    
    return controller;
}

- (NSString *)tabPagerController:(TYTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = self.titleArray[index];
    return title;
}

- (void)tabPagerController:(TYTabPagerController *)tabPagerController willDisplayCell:(UICollectionViewCell<TYTabPagerBarCellProtocol> *)cell atIndex:(NSInteger)index {
    
    self.title = self.titleArray[index];
    
    NSLog(@"barheiht = %f",self.tabBarOrignY);
}



@end
