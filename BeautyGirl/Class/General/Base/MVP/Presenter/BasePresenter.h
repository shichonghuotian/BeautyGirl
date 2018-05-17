//
//  BasePresenter.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITableView.h"

@interface BasePresenter<V> : NSObject {
    
    
}

@property (weak,nonatomic,readonly) V view;

-(instancetype)initWithView:(V)view;

/**
 加载view

 @param view --
 */
-(void)onAttachView:(V)view;

/**
 卸载view
 */
-(void)onDetachview;
-(void)loadData;
-(void)loadMoreData;
@end
