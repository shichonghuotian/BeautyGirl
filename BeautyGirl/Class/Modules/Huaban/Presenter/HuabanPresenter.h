//
//  HuabanPresenter.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BasePresenter.h"
#import "HuabanModel.h"

@interface HuabanPresenter : BasePresenter<id<ITableView>>

@property (assign,nonatomic) NSInteger cID;
@end
