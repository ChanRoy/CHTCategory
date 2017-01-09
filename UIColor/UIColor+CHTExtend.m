//
//  UIColor+CHTExtend.m
//  CHTGithub
//
//  Created by cht on 17/1/9.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIColor+CHTExtend.h"

@implementation UIColor (CHTExtend)

+ (CGFloat)colorComponentFromString:(NSString *)str start:(NSUInteger)start length:(NSUInteger)length{
    
    NSString *subStr = [str substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? subStr : [NSString stringWithFormat:@"%@%@",subStr,subStr];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)colorWithHexString:(NSString *)hexStr{
    
    NSString *colorStr = [[hexStr stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, green, blue;
    switch ([colorStr length]) {
        case 3: {
            //#RGB
            alpha = 1.0f;
            red = [self colorComponentFromString:colorStr start:0 length:1];
            green = [self colorComponentFromString:colorStr start:1 length:1];
            blue = [self colorComponentFromString:colorStr start:2 length:1];
        }
            break;
        case 4:{
            //#ARGB
            alpha = [self colorComponentFromString:colorStr start:0 length:1];
            red = [self colorComponentFromString:colorStr start:1 length:1];
            green = [self colorComponentFromString:colorStr start:2 length:1];
            blue = [self colorComponentFromString:colorStr start:3 length:1];
        }
            break;
        case 6:{
            //RRGGBB
            alpha = 1.0f;
            red = [self colorComponentFromString:colorStr start:0 length:2];
            green = [self colorComponentFromString:colorStr start:2 length:2];
            blue = [self colorComponentFromString:colorStr start:4 length:2];
        }
            break;
        case 8:{
            //AARRGGBB
            alpha = [self colorComponentFromString:colorStr start:0 length:2];
            red = [self colorComponentFromString:colorStr start:2 length:2];
            green = [self colorComponentFromString:colorStr start:4 length:2];
            blue = [self colorComponentFromString:colorStr start:6 length:2];
        }
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)antiColor{
    
    CGFloat red, green, blue, alpha;
    BOOL isCoverted;
    
    red = green = blue = alpha = 0.0f;
    isCoverted = [self getRed:&red green:&green blue:&blue alpha:&alpha];
    //能正确获取当前的颜色值
    if (isCoverted) {
        return [UIColor colorWithRed:(1.0f - red) green:(1.0f - green) blue:(1.0f - blue) alpha:alpha];
    }else{
        return [UIColor whiteColor];
    }
}

@end
