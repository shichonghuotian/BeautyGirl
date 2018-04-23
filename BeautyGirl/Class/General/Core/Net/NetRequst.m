//
//  NetRequst.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "NetRequst.h"

@implementation NetRequst


- (void)doGET:(NSString*) url success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [self setTimeOut:manager];
    
    
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //申明请求的数据是json类型
    
    self.opt = [manager GET:[self getUTF8String:url] parameters:nil progress:nil success:success failure:failure];
    
    
    
    
}

-(NSString*)getUTF8String:(NSString*)url {
    
    
    NSString *encodedUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
          [NSCharacterSet URLQueryAllowedCharacterSet];
    
    NSLog(@"url = %@",url);

    return encodedUrl;

}


-(void)cancel {
    
    if(self.opt&&self.opt.state == NSURLSessionTaskStateRunning) {
        [self.opt cancel];
    }
    
}
-(BOOL)isFisnished {
    return self.opt.state == NSURLSessionTaskStateCompleted;
}
-(BOOL)isCanceled {
    return self.opt.state == NSURLSessionTaskStateCanceling;
    
}

@end
