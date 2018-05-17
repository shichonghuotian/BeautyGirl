//
//  TaoFemale.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowapiResBody.h"

//data class TaoFemale(var showapi_res_body: ShowapiResBody,
//                     var showapi_res_error: String
//                     , var showapi_res_code: Int) {
//}
@interface TaoFemale : NSObject
@property (strong,nonatomic) ShowapiResBody *showapi_res_body;
@property (copy,nonatomic) NSString * showapi_res_error;
@property (assign,nonatomic) NSInteger  showapi_res_code;

@end
