//
//  AppDelegate.m
//  Lovinglife
//
//  Created by 孙志杰 on 16/3/15.
//  Copyright © 2016年 孙志杰. All rights reserved.
//

#import "AppDelegate.h"
#import "LLHomePageViewController.h"
#import "LLChattingViewController.h"
#import "LLMineViewController.h"
#import "LLCommunityViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initControllers];
    return YES;
}

#pragma mark - init
-(void)initControllers
{
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    //初始化四个控制器
    LLHomePageViewController *HomePage=[[LLHomePageViewController alloc]init];
    HomePage.title=@"首页";
    LLCommunityViewController *Community=[[LLCommunityViewController alloc]init];
    Community.title=@"社区";
    LLMineViewController *Mine=[[LLMineViewController alloc]init];
    Mine.title=@"我的";
    LLChattingViewController *Chat=[[LLChattingViewController alloc]init];
    Chat.title=@"聊天";
    //初始化下方四个tabbaritem并交付给控制器
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    HomePage.tabBarItem = tabBarItem1;
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"聊天" image:[[UIImage imageNamed:@"logo2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"logo2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    Chat.tabBarItem = tabBarItem2;
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"社区" image:[[UIImage imageNamed:@"logo3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"logo3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    Community.tabBarItem = tabBarItem3;
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"logo4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"logo4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    Mine.tabBarItem = tabBarItem4;
    //初始化导航控制器并加入视图控制器
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:HomePage];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:Chat];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:Community];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:Mine];
    NSArray *ViewCtro=@[nav1,nav2,nav3,nav4];
    self.tabBarCtr=[[UITabBarController alloc]init];
    self.tabBarCtr.delegate=self;
    //字体颜色
    self.tabBarCtr.tabBar.tintColor=[UIColor colorWithRed:1.0/255.0 green:0 blue:0 alpha:1];
    //把导航一起交付给tabbarcontroller
    self.tabBarCtr.viewControllers=ViewCtro;
    self.window.rootViewController=self.tabBarCtr;
    [self.window makeKeyAndVisible];
}
#pragma mark - tabbarController delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
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
