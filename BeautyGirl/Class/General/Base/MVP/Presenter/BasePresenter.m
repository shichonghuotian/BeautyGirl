//
//  BasePresenter.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BasePresenter.h"

@implementation BasePresenter

-(instancetype)initWithView:(id)view {
    
    self = [super init];
    
    if(self) {
        _view = view;
    }
    return self;
    
}

-(void)onAttachView:(id)view {
    
    _view = view;
}

-(void)onDetachview {
    
    _view = nil;
}


@end
