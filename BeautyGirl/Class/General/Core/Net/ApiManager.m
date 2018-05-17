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

+(void)getDoubanGirlWithID:(NSInteger)cid page:(NSInteger)page success:(void (^)(id  _Nullable responseObject))success failure:(void (^) (void))failure  {
    
//    https://www.dbmeinv.com/dbgroup/show.htm?cid=2&pager_offset=2
    NSString *url = [NSString stringWithFormat:@"%@show.htm?cid=%ld&pager_offset=%ld",Base_Url_Douban,cid,page];
    NetRequst *req = [NetRequst new];

    
    [req doHtmlGET:url success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        if(success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"api mgr failure %@",error);
        
        if(failure) {
            failure();
        }
    }];
    
}

//@GET("819-1")
//abstract fun getHuaBanMeizi(@Query("num") num: Int,
//                            @Query("page") page: Int,
//                            @Query("showapi_appid") appId: String,
//                            @Query("type") type: Int,
//                            @Query("showapi_sign") sign: String): Observable<ResponseBody>
+(void)getHuabanGirlWithNumber:(NSInteger)number page:(NSInteger)page  appId:(NSString*)appId  type:(NSInteger)type  sign:(NSString*)sign success:(void (^)(HuabanResp* resp))success failure:(void (^) (void))failure   {
 
    NSString *url = [NSString stringWithFormat:@"%@819-1?num=%ld&page=%ld&showapi_appid=%@&type=%ld&showapi_sign=%@",Base_Url_Huaban,number,page,appId,type,sign];
    NetRequst *req = [NetRequst new];
    
    
    [req doGET:url success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        HuabanResp *resp = [HuabanResp mj_objectWithKeyValues:responseObject];
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

//@GET("126-2")
//fun getTaoFemale(@Query("page") page: Int,
//                 @Query("showapi_appid") appId: String,
////                 @Query("showapi_sign") sign: String): Observable<TaoFemale>

//fun getTaoFemaleApi(): TaoFemaleaApi {
//    return getRetroFitBuilder(BASE_HUABAN_URL).create(TaoFemaleaApi::class.java)
//}

+(void)getTaofeGirlWithNumber:(NSInteger)number page:(NSInteger)page  appId:(NSString*)appId  type:(NSInteger)type  sign:(NSString*)sign success:(void (^)(TaoFemale* resp))success failure:(void (^) (void))failure   {
    
    NSString *url = [NSString stringWithFormat:@"%@126-2?page=%ld&showapi_appid=%@&showapi_sign=%@",Base_Url_Huaban,page,appId,sign];
    NetRequst *req = [NetRequst new];
    
    
    [req doGET:url success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        TaoFemale *resp = [TaoFemale mj_objectWithKeyValues:responseObject];
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
