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

#define Base_Url_Gank @"http://gank.io/api/"
/**
 网络请求管理器
 */
@interface ApiManager : NSObject

//


+(void)getGankGirl:(NSInteger)number page:(NSInteger)page success:(void (^)(GankGirlResult*  result))success failure:(void (^) (void))failure ;

@end
