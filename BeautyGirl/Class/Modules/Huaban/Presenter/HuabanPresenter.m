//
//  HuabanPresenter.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "HuabanPresenter.h"

@interface HuabanPresenter()

@property (strong,nonatomic)HuabanModel *girlModel;

@end
@implementation HuabanPresenter
-(HuabanModel *)girlModel {
    
    if(!_girlModel) {
        
        _girlModel = [HuabanModel new];
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
    
    [self loadHuabanData];
    
}

-(void)loadMoreData {
    self.girlModel.page += 1;
    
    [self loadHuabanData];
    
}

-(void)loadHuabanData {
    
    //注意顺序
    [self.girlModel.requestCommand execute:nil];
    
}

@end
