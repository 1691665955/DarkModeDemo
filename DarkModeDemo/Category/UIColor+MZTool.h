//
//  UIColor+MZTool.h
//  DarkModeDemo
//
//  Created by 曾龙 on 2020/7/27.
//  Copyright © 2020 com.mz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MZTool)
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
