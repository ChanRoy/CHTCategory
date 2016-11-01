//
//  UIImage+CHTColor.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "UIImage+CHTColor.h"

@implementation UIImage (CHTColor)

+ (UIImage *)createImageWithColor:(UIColor *)color{
    
    CGSize size = CGSizeMake(1.0f, 1.0f);
    
    return [UIImage createImageWithColor: color size: size];
}

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size{
    
    CGRect rect = (CGRect){0.0f, 0.0f, size};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  colorImage;
}

#pragma mark - 使用blend改变图片颜色
//保持图片灰度
- (UIImage *)imageWithTintColor:(UIColor *)tintColor{
    
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

//保持图片透明度
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor{
    
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

//改变图片的颜色模式
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode{
    
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

//获取某一像素的色素
- (UIColor *)colorAtPixel:(CGPoint)point{
    
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height),point)) {
        
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitesPerComponent = 8;
    unsigned char pixelData[4] = {0, 0, 0, 0};
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitesPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0, 0, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//获取灰度图
- (UIImage *)covertToGrayImage{
    
    int width = self.size.width;
    int height = self.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) return nil;
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:cgImage];
    CGContextRelease(context);
    CGImageRelease(cgImage);
    
    return grayImage;
}


@end
