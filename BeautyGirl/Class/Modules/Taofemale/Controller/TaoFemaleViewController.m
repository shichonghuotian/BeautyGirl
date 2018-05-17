//
//  TaoFemaleViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/5/16.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "TaoFemaleViewController.h"
#import "TaoFemalePresenter.h"
@interface TaoFemaleViewController ()

@end

@implementation TaoFemaleViewController
-(Class)presenterClass {
    
    return [TaoFemalePresenter class];
}

-(void)loadCell:(CardTableViewCell *)cell data:(id)data {
    
    
    Contentlist *body = data;
    
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:body.avatarUrl]];    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
