//
//  DoubanPresenter.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "DoubanPresenter.h"

@interface DoubanPresenter()

@property (strong,nonatomic)DoubanModel *girlModel;

@end

@implementation DoubanPresenter

-(DoubanModel *)girlModel {
    
    if(!_girlModel) {
        
        _girlModel = [DoubanModel new];
        @weakify(self)
        
        [[_girlModel.requestCommand executionSignals] subscribeNext:^(RACSignal *signal) {
            @strongify(self)
            //x 是一个 RACSignal
            
            [signal subscribeNext:^(NSArray *array) {
                if(self.girlModel.page >1) {//条件判断这里也可以使用signal，暂时不用
                    [self.view onLoadMoreSuccess:array];
                }else {
                    [self.view onSuccess:array];
                }
                
            } error:^(NSError * _Nullable error) {
                [self.view onFailure];
                
            }];
            
        }];
    }
    
    return _girlModel;
}

-(void)loadData {
    self.girlModel.cID = self.cID;
    self.girlModel.page = 1;
    
    [self loadDoubanData];
    
}

-(void)loadMoreData {
    self.girlModel.page += 1;

    [self loadDoubanData];

}

-(void)loadDoubanData {
   
    //注意顺序
    [self.girlModel.requestCommand execute:nil];
    
}
@end
