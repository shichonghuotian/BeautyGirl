//
//  GankPresenter.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "GankPresenter.h"

@interface GankPresenter()

@property (strong,nonatomic)GankGirlModel *girlModel;

@end

@implementation GankPresenter


-(instancetype)initWithView:(id)view {
    
    self = [super initWithView:view];
    
    if(self) {
        
        
    }
    
    return self;
}

-(GankGirlModel *)girlModel {
    
    if(!_girlModel) {
        
        _girlModel = [GankGirlModel new];
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
    
    
    self.girlModel.page = 1;
    self.girlModel.number = 10;
    
    [self loadGankData];
    
    
}

-(void)loadMoreData {
    
    self.girlModel.page += 1;
    self.girlModel.number = 10;
    
    [self loadGankData];
}

-(void)loadGankData {
    
    
    //注意顺序
    [self.girlModel.requestCommand execute:nil];
    
}
@end
