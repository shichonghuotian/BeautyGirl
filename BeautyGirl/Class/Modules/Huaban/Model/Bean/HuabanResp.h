//
//  HuabanResp.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
//data class HuaBanResp(var showapi_res_code : Int, var showapi_res_error : String , var showapi_res_body : JsonObject) {

@interface HuabanResp : NSObject
@property (assign,nonatomic) NSInteger showapi_res_code;
//
//@property (assign,nonatomic) NSInteger type;
//
@property (copy,nonatomic) NSString *showapi_res_error;

@property (strong,nonatomic) NSDictionary *showapi_res_body;

@end
