//
//  TDTabBarController.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/5/12.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "TDTabBarController.h"
#import "TDNavigationController.h"
#import "TDHomeVC.h"
#import "TDPersonVC.h"

@interface TDTabBarController ()

@end

@implementation TDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupChildViewControllers];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"707070"];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
    selectAttri[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"1296db"];
    selectAttri[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    //通过appearance对tabBarItem的文字属性进行统一设置，这样所有的控制的tabBarItem的文字属性久都是这种样式的了
    UITabBarItem *tabbarItem = [UITabBarItem appearance];
    [tabbarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
    [tabbarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
}

- (void)setupChildViewControllers {
    TDHomeVC *mainPageVC = [[TDHomeVC alloc] initWithNibName:@"TDHomeVC" bundle:nil];
    [self setupController:mainPageVC title:@"首页" image:[UIImage imageNamed:@"tabbar_home_normal"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
    
    TDPersonVC *personVC = [[TDPersonVC alloc] initWithNibName:@"TDPersonVC" bundle:nil];
    [self setupController:personVC title:@"个人中心" image:[UIImage imageNamed:@"tabbar_person_normal"] selectedImage:[UIImage imageNamed:@"tabbar_person_selected"]];
}

-(void)setupController:(UIViewController*) viewController
                 title:(NSString*)title
                 image:(UIImage*) image
         selectedImage:(UIImage*)selectedImage
{
    
    UITabBarItem* item = [[UITabBarItem alloc]initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    viewController.tabBarItem = item;
    TDNavigationController *nvc = [[TDNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nvc];
}

@end
