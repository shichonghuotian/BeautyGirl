//
//  BaseGirlModel.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiManager.h"

@interface BaseGirlModel : NSObject
@property(nonatomic, strong, readonly)RACCommand *requestCommand;
//@property(assign, nonatomic) NSInteger page;
//@property(assign, nonatomic) NSInteger number;

-(RACSignal*)getData;
@end
