//
//  BaseTableViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController
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
    // Do any additional setup after loading the view.
}


-(void)setupData {
    self.dataArray = [NSMutableArray new];
    self.presenter = [[[self presenterClass] alloc] init];
    
    [self.presenter onAttachView:self];
    

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
    
    
    
}

-(Class)presenterClass {
    
    return [BasePresenter class];
}
-(void)loadCell:(CardTableViewCell*)cell data:(id)data {

}

#pragma mark itableview
-(void)onSuccess:(NSArray *)resultArray {
    
    
    
    [self.tableView.mj_header endRefreshing];
    
    [self.dataArray removeAllObjects];
    //可能会竞速
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
    
    id data = self.dataArray[indexPath.row];
    
    //    NSLog(@"imag url = %@",girl.url);
//        [cell.contentImageView setIconURL:[NSURL URLWithString:data.url]];
    

    [self loadCell:cell data:data];
    
    
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
    // Dispose of any resources that can be recreated.
}


@end
