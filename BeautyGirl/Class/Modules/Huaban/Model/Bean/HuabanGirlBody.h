//
//  HuabanGirlBody.h
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseGirlBody.h"

@interface HuabanGirlBody : BaseGirlBody
//data class HuaBanBody(var thumb:String , var title : String , var url : String , var type : Int) {

@property (copy,nonatomic) NSString *thumb;
@property (copy,nonatomic) NSString *title;

@property (assign,nonatomic) NSInteger type;


@end
