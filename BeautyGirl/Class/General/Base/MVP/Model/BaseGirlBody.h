//
//  BaseGirlBody.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

//写一个基类，主要是处理一下imagesize的问题
@interface BaseGirlBody : NSObject
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) CGSize imageSize;

@end
