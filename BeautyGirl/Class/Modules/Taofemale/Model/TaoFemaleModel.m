//
//  TaoFemaleModel.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "TaoFemaleModel.h"

@implementation TaoFemaleModel
-(RACSignal *)getData {
    
    return [self getGirl:self.number page:self.page];
}




-(RACSignal *)getGirl:(NSInteger)num page:(NSInteger)page {
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        [ApiManager getTaofeGirlWithNumber:num page:page appId:Huaban_App_ID type:0 sign:Huaban_APP_SIGN success:^(TaoFemale *resp) {
            [subscriber sendNext:resp];
            [subscriber sendCompleted];
        } failure:^{
            [subscriber sendError:[NSError new]];

        }];
        
      
        
        return nil;
    }];
    
    return   [[[signal filter:^BOOL(id  _Nullable responseObject) {
        
        return YES;
    }] map:^id (TaoFemale* resp) {
        return resp.showapi_res_body.pagebean.contentlist;
    }] deliverOn:[RACScheduler mainThreadScheduler]];
    
    
    
}
@end
