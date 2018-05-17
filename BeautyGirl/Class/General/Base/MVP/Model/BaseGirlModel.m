//
//  BaseGirlModel.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseGirlModel.h"

@implementation BaseGirlModel
//使用命令，直接执行
-(instancetype)init {
    self = [super init];
    
    if(self) {
        
        @weakify(self)
        _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self)
            return [self getData];
        }];
        
        
        
    }
    
    return self;
}

-(RACSignal*)getData {
    
    return nil;
}
@end
