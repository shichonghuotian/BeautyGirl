//
//  DoubanViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "DoubanViewController.h"
#import "DoubanPresenter.h"

@interface DoubanViewController ()

@end

@implementation DoubanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

-(Class)presenterClass {
    
    return [DoubanPresenter class];
}
-(void)setupData {
    [super setupData];
    //设置id
    [self.presenter setCID:self.cID];
}

-(void)loadCell:(CardTableViewCell *)cell data:(id)data {
    
    DoubanGirlBody *body = data;
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:body.url]];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
