//
//  GankGirlResult.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GankGirlBody.h"

@interface GankGirlResult : NSObject

@property (assign,nonatomic) BOOL error;

@property (strong,nonatomic) NSArray<GankGirlBody*> *results;

@end
