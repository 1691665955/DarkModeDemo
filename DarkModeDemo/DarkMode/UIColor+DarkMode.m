//
//  UIColor+DarkMode.m
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/7/27.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import "UIColor+DarkMode.h"

@implementation UIColor (DarkMode)
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                //暗黑模式
                return darkColor;
            } else {
                //普通模式
                return lightColor;
            }
        }];
    } else {
        return lightColor;
    }
}
@end
