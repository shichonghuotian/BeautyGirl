//
//  GankGirlBody.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseGirlBody.h"

@interface GankGirlBody : BaseGirlBody

@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *createAt;
@property (copy,nonatomic) NSString *desc;
@property (copy,nonatomic) NSString *publishedAt;
@property (copy,nonatomic) NSString *source;
@property (copy,nonatomic) NSString *type;
@property (assign,nonatomic) BOOL used;
@property (copy,nonatomic) NSString *who;



@end
