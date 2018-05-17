//
//  ShowapiResBody.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
//data class ShowapiResBody(var ret_code : String, var pagebean: Pagebean) {
#import "PageBean.h"

@interface ShowapiResBody : NSObject

@property (copy,nonatomic) NSString * ret_code;
@property (strong,nonatomic) PageBean * pagebean;

@end
