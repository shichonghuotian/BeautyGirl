//
//  MainViewController.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/23.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "MainViewController.h"
#import "MainPresenter.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

#import "DoubanPagerController.h"
#import "TaoFemaleViewController.h"
#import "GankViewController.h"
#import "HuabanPagerController.h"

@interface MainViewController ()

//放一个contrller
@property (strong,nonatomic) UIViewController *currentController;

@property (strong,nonatomic) NSArray *controllers;

@end

@implementation MainViewController

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(menuAction)];
    self.controllers = @[[[GankViewController alloc] init],[[DoubanPagerController alloc] init],[[HuabanPagerController alloc] init],[[TaoFemaleViewController alloc] init]];
    
    @weakify(self)
    [MGJRouter registerURLPattern:@"wyg://main/:query" toHandler:^(NSDictionary *routerParameters) {
        @strongify(self)
        
        NSInteger index = [[routerParameters objectForKey:@"query"] integerValue];
        [self replaceController:index];
        //
        NSLog(@"routerParameters %@",routerParameters);
    }];
    

    [self addGirlController];
}
-(void)addGirlController {
    
    self.currentController = [self.controllers firstObject];
    
    [self addChildViewController:self.currentController];
    
    [self.view addSubview:self.currentController.view];
    
    [self.currentController didMoveToParentViewController:self];
    
}

-(void)replaceController:(NSInteger)index {
    if(index < self.controllers.count) {
        UIViewController *vc = self.controllers[index];
        
        if(vc == self.currentController) {
            return;
        }
        
        [self replaceContoller:self.currentController toVC:vc];
    }
    
}


-(void)replaceContoller:(UIViewController*)fromVC toVC:(UIViewController*)toVC {
    [self addChildViewController:toVC];

    [self transitionFromViewController:fromVC toViewController:toVC duration:1 options:UIViewAnimationOptionLayoutSubviews  animations:nil completion:^(BOOL finished) {
       
        if(finished) {
            [toVC didMoveToParentViewController:self];//确认关系
            
            [self removeGirlController:fromVC];
            self.currentController = toVC;
        }
        
    }];
}


-(void)removeGirlController:(UIViewController*)childController {
    //移除上一个
    [childController willMoveToParentViewController:nil];
    [childController removeFromParentViewController];
}


-(void)menuAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

    
}


//-(void)aa  {
//
//    self.bannerView = [[GADBannerView alloc] init];
//    self.bannerView.backgroundColor = [UIColor redColor];
//    //    [self.view addSubview:self.bannerView];
//
//    self.bannerView.adUnitID = GAD_UUID;
//    self.bannerView.rootViewController = self;
//    GADRequest *request = [GADRequest request];
//
//    request.testDevices = @[ kGADSimulatorID ];
//    self.bannerView.userInteractionEnabled = NO;
//
//    [self.bannerView loadRequest:request];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



@end
