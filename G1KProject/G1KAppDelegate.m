//
//  G1KAppDelegate.m
//  G1KProject
//
//  Created by Sobf Leo on 16/11/2.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KAppDelegate.h"
#import "G1KTabBarController.h"
@implementation G1KAppDelegate
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[G1KTabBarController alloc]init];
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
