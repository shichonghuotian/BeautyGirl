//
//  BaseTableViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseTableViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface BaseTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout>

@property (assign,nonatomic) BOOL scrollUporDown;
//@property (assign,nonatomic) BOOL _scrollUporDown;

@end

@implementation BaseTableViewController
-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //这些内容转换到presenter中
    if(!self.hasLoaded) {
        [self.collectionView.mj_header beginRefreshing];
        
        self.hasLoaded = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self followScrollView:self.collectionView];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//
//    [self showNavBarAnimated:NO];
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
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView.collectionViewLayout = layout;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.bottom.equalTo(self.view);
    }];
    [self.collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:[CardCollectionViewCell CellIdentifier]];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.presenter loadData];
        
    }] ;
    
    
    
    
    
}

-(Class)presenterClass {
    
    return [BasePresenter class];
}
-(void)loadCell:(CardTableViewCell*)cell data:(id)data {

}

#pragma mark itableview
-(void)onSuccess:(NSArray *)resultArray {
    
    
    
    [self.collectionView.mj_header endRefreshing];
    
    [self.dataArray removeAllObjects];
    //可能会竞速
    [self.dataArray addObjectsFromArray:resultArray];
    [self.collectionView reloadData];
    
    @weakify(self)
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        @strongify(self)
        [self.presenter loadMoreData];
    }];
    
    
}
-(void)onLoadMoreSuccess:(NSArray*)resultArray {
    [self.collectionView.mj_footer endRefreshing];
    
    [self.dataArray addObjectsFromArray:resultArray];
    [self.collectionView reloadData];
}



-(void)onFailure {
    NSLog(@"onFailure");
    [self.collectionView.mj_header endRefreshing];
    
    [self.collectionView.mj_footer endRefreshing];
    
    [self showTextHUD:@"request faild"];
}



#pragma mark - TableView DataSource delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CardCollectionViewCell CellIdentifier] forIndexPath:indexPath];
    
    BaseGirlBody *body = [self.dataArray objectAtIndex:indexPath.row];
    
    NSString *imgUrlString = body.url;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrlString] placeholderImage:[UIImage imageNamed:@"loading"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            if (!CGSizeEqualToSize(body.imageSize, image.size)) {
                body.imageSize = image.size;
                [collectionView reloadItemsAtIndexPaths:@[indexPath]];
            }
        }
    }];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseGirlBody *body = [self.dataArray objectAtIndex:indexPath.row];
    if (!CGSizeEqualToSize(body.imageSize, CGSizeZero)) {
        return body.imageSize;
    }
    return CGSizeMake(150, 150);
}

#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCollectionViewCell *cell =(CardCollectionViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    [self showLargeImagView:cell.imageView];

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    static float newy = 0;
//    static float oldy = 0;
//    //获取当前滚动视图的contentOffset.y
//    newy = scrollView.contentOffset.y;
//    //判断滚动视图向上还是向下
//    if (newy != oldy ) {
//        if (newy > oldy) {
//            self.scrollUporDown = YES;
//        }else if(newy < oldy){
//            self.scrollUporDown = NO;
//        }
//        oldy = newy;
//    }
//    //定义初始的navigationBar的位置
//    if (newy == -60) {
//        [UIView animateWithDuration:1 animations:^{
//            self.navigationController.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
//        }];
//    }else{
//        if (self.scrollUporDown == YES) {
//            [UIView animateWithDuration:1 animations:^{
//                self.navigationController.navigationBar.frame = CGRectMake(0, -40, self.view.frame.size.width, 40);
//            }];
//        }
//        else if (self.scrollUporDown == NO) {
//            [UIView animateWithDuration:0.5 animations:^{
//                self.navigationController.navigationBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 40);
//            }];
//        }
//    }
//
}

-(void)showLargeImagView:(UIImageView*)imageView {
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    imageInfo.image =imageView.image;
    imageInfo.referenceRect = imageView.frame;
    imageInfo.referenceView = imageView.superview;
    JTSImageViewController *imageViewController = [[JTSImageViewController alloc] initWithImageInfo:imageInfo mode:JTSImageViewControllerMode_Image backgroundStyle:JTSImageViewControllerBackgroundOption_None];
    [imageViewController showFromViewController:self transition:JTSImageViewControllerTransition_FromOriginalPosition];
    
}


- (void)dealloc {
//    [self stopFollowingScrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
