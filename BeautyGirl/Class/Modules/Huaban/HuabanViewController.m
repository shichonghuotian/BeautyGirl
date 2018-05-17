//
//  HuabanViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "HuabanViewController.h"
#import "HuabanPresenter.h"

@interface HuabanViewController ()

@end

@implementation HuabanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(Class)presenterClass {
    
    return [HuabanPresenter class];
}

-(void)setupData {
    [super setupData];
    //设置id
    [self.presenter setCID:self.cID];
}

-(void)loadCell:(CardTableViewCell *)cell data:(id)data {
    

        HuabanGirlBody *body = data;
    
        [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:body.thumb]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
