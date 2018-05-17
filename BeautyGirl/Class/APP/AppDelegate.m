//
//  AppDelegate.m
//  BeautyGirl
//
//  Created by Apple on 2018/4/22.
//  Copyright © 2018年 wy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <MMDrawerController/MMDrawerController.h>
#import <Firebase/Firebase.h>
#import "MenuViewController.h"

@interface AppDelegate ()
@property (strong,nonatomic) MMDrawerController *rootController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [FIRApp configure];
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-9193264970438351/5347714858"];
    

    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];


    UIViewController *centerVC = [[MainViewController alloc]init];
    UIViewController *leftVC = [[MenuViewController alloc]init];
    
    UINavigationController *centerNvaVC = [[UINavigationController alloc]initWithRootViewController:centerVC];
    UINavigationController *leftNvaVC = [[UINavigationController alloc]initWithRootViewController:leftVC];
    
    self.rootController = [[MMDrawerController alloc]initWithCenterViewController:centerNvaVC leftDrawerViewController:leftNvaVC rightDrawerViewController:nil];
    
    self.rootController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.rootController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    //5、设置左右两边抽屉显示的多少
    self.rootController.maximumLeftDrawerWidth = 200.0;
    self.rootController.maximumRightDrawerWidth = 200.0;
   
    
    
    self.window.rootViewController = self.rootController;;

    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
