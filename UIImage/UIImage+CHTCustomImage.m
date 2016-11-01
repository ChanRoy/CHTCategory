//
//  UIImage+CHTCustomImage.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "UIImage+CHTCustomImage.h"

@implementation UIImage (CHTCustomImage)

//给图片画圆角，不使用离屏渲染
- (UIImage *)setImageCornerRadius:(CGFloat)cornerRadius{
    
    CGRect imageRect = (CGRect){0.0f, 0.0f, self.size};
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:cornerRadius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:imageRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
