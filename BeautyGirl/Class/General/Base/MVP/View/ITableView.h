//
//  ITableView.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITableView <NSObject>
-(void)onSuccess:(NSArray*)resultArray;
-(void)onLoadMoreSuccess:(NSArray*)resultArray;

-(void)onFailure;

@end
