//
//  BaseViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()
@property (strong,nonatomic)MBProgressHUD *hud;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    [self prepareLayout];
    
    
}

-(void)setupData {
    
}

-(void)prepareLayout {
    
}

-(void)showTextHUD:(NSString *)text {
    
    [self showHUD:text delay:1 mode:MBProgressHUDModeText];
}

-(void)showHUD:(NSString *)text delay:(NSTimeInterval)delay mode:(MBProgressHUDMode)mode{
    
    self.hud = [MBProgressHUD showHUDAddedTo:self.navigationController?self.navigationController.view :self.view animated:YES];
    self.hud.mode = mode;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.bezelView.backgroundColor = [UIColor blackColor] ;
    self.hud.label.text = text;
    self.hud.label.textColor = [UIColor whiteColor];
    self.hud.activityIndicatorColor = [UIColor whiteColor];
    [self.hud showAnimated:YES];
    
    [self.hud hideAnimated:YES afterDelay:1];
    
    
}


-(void)hideHUD {
    [self.hud hideAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
