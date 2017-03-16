//
//  UIImage+CHTGradient.m
//  CHTGithub
//
//  Created by cht on 2017/3/16.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIImage+CHTGradient.h"

@implementation UIImage (CHTGradient)

+ (UIImage *)imageWithRadientColors:(NSArray <UIColor *>*)colors frame:(CGRect)frame direction:(CHTGradientDirection)direction{
    
    NSMutableArray *cgColors = [NSMutableArray array];
    
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [cgColors addObject:(id)obj.CGColor];
    }];
    
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)cgColors, NULL);
    
    CGPoint start;
    
    CGPoint end;
    
    switch (direction) {
        case CHTGradientDirectionTopToBottom:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, frame.size.height);

        }
            break;
        case CHTGradientDirectionBottomToTop:
        {
            
            start = CGPointMake(0.0, frame.size.height);
            end = CGPointMake(0.0, 0.0);
        }
            break;
        case CHTGradientDirectionLeftToRight:
        {
            
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, 0.0);
        }
            break;
        case CHTGradientDirectionRightToLeft:
        {
            
            start = CGPointMake(frame.size.width, 0.0);
            end = CGPointMake(0.0, 0.0);
        }
            break;
        default:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, 0.0);
        }
            break;
    }
    
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

@end
