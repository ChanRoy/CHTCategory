//
//  NSString+CHTStringTool.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CHTStringTool)

#pragma mark - 类方法
//给int金额数字每三位添加一个逗号
+ (NSString *)stringForIntNumberFormatterDecimalStyle:(NSString *)money;

//给float金额数字每三位添加一个逗号
+ (NSString *)stringForFloatNumberFormatterDecimalStyle:(NSString *)money;

//给手机号码添加四位一个空格
+ (NSString *)stringForPhoneNumberFormatter:(NSString *)phoneNumber;

#pragma mark - 实例方法
//获取字符串的size
- (CGSize)cht_getSizeWithFont:(UIFont *)font;

//获取字符串的宽度
- (CGFloat)cht_getWidthWithFont:(UIFont *)font;

//获取字符串的高度
- (CGFloat)cht_getHeightWithFont:(UIFont *)font;

@end
