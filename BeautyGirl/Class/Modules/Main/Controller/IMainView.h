//
//  IMainView.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol IMainView <NSObject>

-(void)onSuccess:(NSArray*)resultArray;
-(void)onLoadMoreSuccess:(NSArray*)resultArray;

-(void)onFailure;

@end
