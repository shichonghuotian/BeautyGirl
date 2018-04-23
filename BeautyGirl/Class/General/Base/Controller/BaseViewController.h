//
//  BaseViewController.h
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MBProgressHUD;
/**
 controller 基类
 */
@interface BaseViewController : UIViewController


/**
 初始化数据
 */
-(void)setupData;

/**
 布局
 */
-(void)prepareLayout;

-(void)showTextHUD:(NSString *)text;
-(void)hideHUD;
@end
