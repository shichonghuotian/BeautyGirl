//
//  ApiManager.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetRequst.h"
#import "GankGirlResult.h"
#import "HuabanResp.h"
#import "TaoFemale.h"

#define Base_Url_Gank @"http://gank.io/api/"
#define Base_Url_Douban  @"http://www.dbmeinv.com/dbgroup/"
#define Base_Url_Huaban  @"http://route.showapi.com/"

/**
 网络请求管理器
 */
@interface ApiManager : NSObject

//


+(void)getGankGirl:(NSInteger)number page:(NSInteger)page success:(void (^)(GankGirlResult*  result))success failure:(void (^) (void))failure ;

//@GET("show.htm")
//fun getDoubanMeizi(@Query("cid") cid: Int, @Query("pager_offset") pageNum: Int): Observable<Response<ResponseBody>>
+(void)getDoubanGirlWithID:(NSInteger)cid page:(NSInteger)page success:(void (^)(id  _Nullable responseObject))success failure:(void (^) (void))failure  ;

+(void)getHuabanGirlWithNumber:(NSInteger)number page:(NSInteger)page  appId:(NSString*)appId  type:(NSInteger)type  sign:(NSString*)sign success:(void (^)(HuabanResp* resp))success failure:(void (^) (void))failure  ;

+(void)getTaofeGirlWithNumber:(NSInteger)number page:(NSInteger)page  appId:(NSString*)appId  type:(NSInteger)type  sign:(NSString*)sign success:(void (^)(TaoFemale* resp))success failure:(void (^) (void))failure ;

@end
