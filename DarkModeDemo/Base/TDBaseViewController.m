//
//  TDBaseViewController.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/5/12.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "TDBaseViewController.h"

@interface TDBaseViewController ()

@end

@implementation TDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:[UIColor blackColor]];
    [self refreshUIForTraitCollection];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (@available(iOS 13.0, *)) {
        if (previousTraitCollection.userInterfaceStyle != [UITraitCollection currentTraitCollection].userInterfaceStyle) {
            [self refreshUIForTraitCollection];
        }
    }
}

- (void)refreshUIForTraitCollection {
    
}

@end
