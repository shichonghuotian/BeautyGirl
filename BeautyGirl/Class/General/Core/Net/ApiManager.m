//
//  ApiManager.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "ApiManager.h"

@implementation ApiManager


+(void)getGankGirl:(NSInteger)number page:(NSInteger)page success:(void (^)(GankGirlResult*  result))success failure:(void (^) (void))failure {

    //请求一下
    

    NetRequst *req = [NetRequst new];
//    http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/1
    
    NSString *url = [NSString stringWithFormat:@"%@data/福利/%ld/%ld",Base_Url_Gank,number,page];
    
    [req doGET:url success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        GankGirlResult *resp = [GankGirlResult mj_objectWithKeyValues:responseObject];
        
        if(success) {
            success(resp);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"api mgr failure %@",error);

        if(failure) {
            failure();
        }
    }];

}
@end
