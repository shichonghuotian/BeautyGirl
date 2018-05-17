//
//  GankViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/17.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "GankViewController.h"
#import "GankPresenter.h"
@interface GankViewController ()

@end

@implementation GankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(Class)presenterClass {
    
    return [GankPresenter class];
}

-(void)loadCell:(CardTableViewCell *)cell data:(id)data {
    
    
    GankGirlBody *body = data;
    
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:body.url]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
