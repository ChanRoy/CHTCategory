//
//  UIColor+CHTExtend.h
//  CHTGithub
//
//  Created by cht on 17/1/9.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CHTExtend)


/**
 get color from hex string

 @param hexStr #RGB #ARGB #RRGGBB #AARRGGBB
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)hexStr;

//获取当前颜色的反色
- (UIColor *)antiColor;

//判断两个颜色是否相等
- (BOOL)isEqualWithColor:(UIColor *)color;

//get component of color
- (CGFloat)getRed;
- (CGFloat)getGreen;
- (CGFloat)getBlue;
- (CGFloat)getAlpha;

@end
