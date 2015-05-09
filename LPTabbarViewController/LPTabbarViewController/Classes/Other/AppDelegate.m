//
//  AppDelegate.m
//  LPTabbarViewController
//
//  Created by 彭利民 on 15/5/9.
//  Copyright (c) 2015年 彭利民. All rights reserved.
//

#import "AppDelegate.h"
#import "LPMainViewController.h"
#import "LPItemThreeViewController.h"
#import "LPItemTwoViewController.h"
#import "LPItemOneTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard  *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LPMainViewController *mainVc = [storyBoard instantiateViewControllerWithIdentifier:@"LPMainViewController"];
    LPItemOneTableViewController *oneVc = [[LPItemOneTableViewController alloc] init];
    LPItemTwoViewController *twoVc = [[LPItemTwoViewController alloc] init];
    LPItemThreeViewController *threeVc = [[LPItemThreeViewController alloc] init];
    mainVc.controllers = @[oneVc,twoVc,threeVc];
//    mainVc.animationType = AnimationTypeNone;
//    mainVc.animationType = AnimationTypeCube;
//    mainVc.animationType = AnimationTypeFade;
    mainVc.animationType = AnimationTypeCustom;
    mainVc.animationType = AnimationTypeMoveIn;
    mainVc.animationType = AnimationTypeReveal;
    mainVc.animationType = AnimationTypePageCurl;
//
    mainVc.animationType = AnimationTypePageUnCurl;
    mainVc.animationType = AnimationTypeSuckEffect;
//
//    mainVc.animationType = AnimationTypeRippleEffect;
//    mainVc.animationType = AnimationTypeOglFlip;
    


    self.window.rootViewController = mainVc;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
