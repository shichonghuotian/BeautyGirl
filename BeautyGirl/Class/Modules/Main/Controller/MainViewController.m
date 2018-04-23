//
//  MainViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "MainViewController.h"
#import "MainPresenter.h"
#import "CardTableViewCell.h"
#import "JTSImageViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <Firebase/Firebase.h>

@interface MainViewController ()<IMainView,UITableViewDataSource,UITableViewDelegate,GADInterstitialDelegate>

@property (strong,nonatomic) MainPresenter *presenter;

@property (strong,nonatomic) UITableView *tableView ;

@property (strong,nonatomic) GADBannerView *bannerView ;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) UIImageView *imageView ;
@property (assign,nonatomic) BOOL hasLoaded ;

@end

@implementation MainViewController

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //这些内容转换到presenter中
    if(!self.hasLoaded) {
        [self.tableView.mj_header beginRefreshing];

        self.hasLoaded = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    
}

-(void)setupData {
    self.dataArray = [NSMutableArray new];
    self.presenter = [[MainPresenter alloc] initWithView:self];
 
}

-(void)prepareLayout {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;//期望高度

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.presenter loadData];

    }] ;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       
        [self.presenter loadMoreData];
    }];
    
    [self.tableView registerClass:[CardTableViewCell class] forCellReuseIdentifier:[CardTableViewCell TableViewCellIdentifier]];

    
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//
//    [self.view addSubview:self.imageView];
//
//    self.imageView.backgroundColor = [UIColor redColor];
    
    self.bannerView = [[GADBannerView alloc] init];
    self.bannerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bannerView];
    
    self.bannerView.adUnitID = GAD_UUID;
    self.bannerView.rootViewController = self;
    GADRequest *request = [GADRequest request];

    request.testDevices = @[ kGADSimulatorID ];
    self.bannerView.userInteractionEnabled = NO;

    [self.bannerView loadRequest:request];
    
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top).offset(44);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(50);

    }];
    
}

-(void)onSuccess:(NSArray *)resultArray {
    
    
    
    [self.tableView.mj_header endRefreshing];
    
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    
    [self.dataArray addObjectsFromArray:resultArray];
    [self.tableView reloadData];

}
-(void)onLoadMoreSuccess:(NSArray*)resultArray {
    [self.tableView.mj_footer endRefreshing];

    [self.dataArray addObjectsFromArray:resultArray];
    [self.tableView reloadData];
}



-(void)onFailure {
    NSLog(@"onFailure");
    [self.tableView.mj_header endRefreshing];

    [self.tableView.mj_footer endRefreshing];
    
    [self showTextHUD:@"request faild"];
}

#pragma mark - TableView DataSource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CardTableViewCell TableViewCellIdentifier] forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    GankGirlBody *girl = self.dataArray[indexPath.row];
    
//    NSLog(@"imag url = %@",girl.url);
//    [cell.contentImageView setIconURL:[NSURL URLWithString:girl.url]];
    
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:girl.url]];
    
        
    
    return cell;
    
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CardTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self showLargeImagView:cell.contentImageView];

}


-(void)showLargeImagView:(UIImageView*)imageView {
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    imageInfo.image =imageView.image;
    imageInfo.referenceRect = imageView.frame;
    imageInfo.referenceView = imageView.superview;
    JTSImageViewController *imageViewController = [[JTSImageViewController alloc] initWithImageInfo:imageInfo mode:JTSImageViewControllerMode_Image backgroundStyle:JTSImageViewControllerBackgroundOption_None];
    [imageViewController showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



@end
