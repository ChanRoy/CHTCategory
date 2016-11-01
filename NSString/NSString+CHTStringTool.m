//
//  NSString+CHTStringTool.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "NSString+CHTStringTool.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define CHT_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define CHT_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

//218.94.0.22:12434

@implementation NSString (CHTStringTool)

//给int金额数字每三位添加一个逗号
+ (NSString *)stringForIntNumberFormatterDecimalStyle:(NSString *)money{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    
    int moneyValue = money.intValue;
    NSString *moneyStr = [formatter stringFromNumber:@(moneyValue)];
    
    return moneyStr;
}

//给float金额数字每三位添加一个逗号
+ (NSString *)stringForFloatNumberFormatterDecimalStyle:(NSString *)money{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    
    float moneyValue = money.floatValue;
    NSString *moneyStr = [formatter stringFromNumber:@(moneyValue)];
    
    return moneyStr;
}

//给手机号码添加四位一个空格
+ (NSString *)stringForPhoneNumberFormatter:(NSString *)phoneNumber{
    
    NSInteger length = phoneNumber.length;
    NSMutableString *mutalStr = [NSMutableString stringWithString:phoneNumber];
    NSMutableString *newStr = [NSMutableString new];
    while (length > 4) {
        
        length -= 4;
        NSRange range = NSMakeRange(mutalStr.length - 4, 4);
        NSString *subStr = [mutalStr substringWithRange:range];
        [newStr insertString:subStr atIndex:0];
        [newStr insertString:@" " atIndex:0];
        [mutalStr deleteCharactersInRange:range];
    }
    [newStr insertString:mutalStr atIndex:0];
    
    return newStr;
}

//获取字符串的size
- (CGSize)cht_getSizeWithFont:(UIFont *)font{
    
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 999);
    CGSize strSize = CHT_MULTILINE_TEXTSIZE(self, font, maxSize, UILineBreakModeCharacterWrap);
    
    return strSize;
}

//获取字符串的宽度
- (CGFloat)cht_getWidthWithFont:(UIFont *)font{
    
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 999);
    CGSize strSize = CHT_MULTILINE_TEXTSIZE(self, font, maxSize, UILineBreakModeCharacterWrap);
    
    return strSize.width;
}

//获取字符串的高度
- (CGFloat)cht_getHeightWithFont:(UIFont *)font{
    
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 999);
    CGSize strSize = CHT_MULTILINE_TEXTSIZE(self, font, maxSize, UILineBreakModeCharacterWrap);
    
    return strSize.height;
}



@end
