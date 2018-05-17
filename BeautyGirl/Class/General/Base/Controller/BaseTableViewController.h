//
//  BaseTableViewController.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePresenter.h"
#import "CardTableViewCell.h"
#import "JTSImageViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "ITableView.h"
#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<ITableView,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) id presenter;

@property (strong,nonatomic) UITableView *tableView ;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (assign,nonatomic) BOOL hasLoaded ;


//
-(Class)presenterClass;

-(void)loadCell:(CardTableViewCell*)cell data:(id)data;
@end
