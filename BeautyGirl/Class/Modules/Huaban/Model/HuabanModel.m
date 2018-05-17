//
//  HuabanModel.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "HuabanModel.h"

@implementation HuabanModel

-(RACSignal *)getData {
    
    return [self getGirl:self.cID page:self.page];
}
-(NSArray*)parseData:(HuabanResp*)resp {

    NSDictionary *dic = resp.showapi_res_body;
    
//    NSArray *keyArray = dic.al;
    
    NSEnumerator *enumerator = dic.allValues.objectEnumerator;
    

    NSMutableArray *array = [NSMutableArray new];
    NSDictionary *valueDic = nil;
    while (valueDic = [enumerator nextObject]) {
        
        //转换成
        HuabanGirlBody *resp = [HuabanGirlBody mj_objectWithKeyValues:valueDic];

        if(resp) {
            [array addObject:resp];

        }
        
    }

    return array;
}



-(RACSignal *)getGirl:(NSInteger)cid page:(NSInteger)page {
    @weakify(self)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [ApiManager getHuabanGirlWithNumber:20 page:page appId:Huaban_App_ID type:cid sign:Huaban_APP_SIGN success:^(HuabanResp* resp) {
            
            [subscriber sendNext:resp];
            [subscriber sendCompleted];
        } failure:^{
             [subscriber sendError:[NSError new]];
        }];
     
        
        return nil;
    }];
    
    return   [[[signal filter:^BOOL(id  _Nullable responseObject) {
        
        return YES;
    }] map:^id (HuabanResp* resp) {
        @strongify(self)
        return [self parseData:resp];
    }] deliverOn:[RACScheduler mainThreadScheduler]];
    
    
    
}

@end
