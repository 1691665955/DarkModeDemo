//
//  AppDelegate.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/5/12.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "AppDelegate.h"
#import "TDTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:[UIColor whiteColor]];
    self.window.rootViewController = [[TDTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
