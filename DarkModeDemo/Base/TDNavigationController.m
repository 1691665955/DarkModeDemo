//
//  TDNavigationController.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/5/12.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "TDNavigationController.h"

@interface TDNavigationController ()

@end

@implementation TDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = (id)self;
    [self.navigationBar setTranslucent:NO];
    [self changeNavigationBarBackgroundImage];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}


- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (@available(iOS 13.0, *)) {
        if (previousTraitCollection.userInterfaceStyle != [UITraitCollection currentTraitCollection].userInterfaceStyle) {
            [self changeNavigationBarBackgroundImage];
        }
    }
}

- (void)changeNavigationBarBackgroundImage {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"131313"]] forBarMetrics:UIBarMetricsDefault];
        } else {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        }
    }
    if (self.viewControllers.count > 1) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        self.viewControllers.lastObject.navigationItem.leftBarButtonItem = backItem;
    }
}

@end
