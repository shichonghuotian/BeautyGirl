//
//  GankGirlModel.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "GankGirlModel.h"

@implementation GankGirlModel


-(RACSignal *)getData {
    
     return [self getGirl:self.number page:self.page];
}



-(RACSignal *)getGirl:(NSInteger)number page:(NSInteger)page {
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      
        [ApiManager getGankGirl:number page:page success:^(GankGirlResult *result) {
            [subscriber sendNext:result];
            [subscriber sendCompleted];

        } failure:^{
            [subscriber sendError:[NSError new]];

        }];
        
    
        
        return nil;
    }];
    
   return   [[[signal filter:^BOOL(GankGirlResult *result) {
        
        return !result.error;
    }] map:^id (GankGirlResult* result) {
        
        return result.results;
    }] deliverOn:[RACScheduler mainThreadScheduler]];
    
}

@end
