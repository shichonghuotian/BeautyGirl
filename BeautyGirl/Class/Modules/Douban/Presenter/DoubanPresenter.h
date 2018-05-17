//
//  DoubanPresenter.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//IPADir

#import <Foundation/Foundation.h>
#import "BasePresenter.h"
#import "DoubanModel.h"

@interface DoubanPresenter :  BasePresenter<id<ITableView>>
@property(assign, nonatomic) NSInteger cID;



@end
