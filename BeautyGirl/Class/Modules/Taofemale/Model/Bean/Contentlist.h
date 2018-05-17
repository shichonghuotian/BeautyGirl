//
//  Contentlist.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
//data class Contentlist(var totalFavorNum : Int , var realName: String,
//                       var totalFanNum : String , var link: String,
//                       var weight : String , var avatarUrl : String,
//                       var type : String , var userId :String,
//                       var city : String , var height :String,
//                       var imgList : ArrayList<String> , var cardUrl :String) {

@interface Contentlist : NSObject
@property (assign,nonatomic) NSInteger totalFavorNum;
@property (copy,nonatomic) NSString * realName;
@property (copy,nonatomic) NSString * totalFanNum;
@property (copy,nonatomic) NSString * link;
@property (copy,nonatomic) NSString * weight;
@property (copy,nonatomic) NSString * avatarUrl;
@property (copy,nonatomic) NSString * type;
@property (copy,nonatomic) NSString * userId;
@property (copy,nonatomic) NSString * city;
@property (copy,nonatomic) NSString * height;

@property (strong,nonatomic) NSArray *imgList ;
@property (copy,nonatomic) NSString *cardUrl;


@end
