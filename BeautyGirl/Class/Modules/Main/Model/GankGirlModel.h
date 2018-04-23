//
//  GankGirlModel.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GankGirlResult.h"
#import "ApiManager.h"

@interface GankGirlModel : NSObject
@property(nonatomic, strong, readonly)RACCommand *requestCommand;
@property(assign, nonatomic) NSInteger page;
@property(assign, nonatomic) NSInteger number;


@end
