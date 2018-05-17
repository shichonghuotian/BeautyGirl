//
//  PageBean.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contentlist.h"

//data class Pagebean(var allPages: String , var allNum : String , var currentPage : String , var maxResult : String,
//                    var contentlist: ArrayList<Contentlist>) {

@interface PageBean : NSObject
@property (copy,nonatomic) NSString * allPages;
@property (copy,nonatomic) NSString * allNum;
@property (copy,nonatomic) NSString * currentPage;
@property (copy,nonatomic) NSString * maxResult;
@property (strong,nonatomic) NSArray * contentlist;

@end
