//
//  NetRequst.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetRequst : NSObject
@property (strong,nonatomic) NSURLSessionTask *opt;

- (void)doGET:(NSString*) url success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;
- (void)doHtmlGET:(NSString*) url success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

@end
