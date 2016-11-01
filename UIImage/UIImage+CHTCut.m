//
//  UIImage+CHTCut.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "UIImage+CHTCut.h"

@implementation UIImage (CHTCut)

//剪切图片为圆形
- (UIImage *)roundImage{
    
    CGSize size = [self sizeFromImage:self];
    
    CGRect rect = (CGRect){CGPointZero, size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (CGSize)sizeFromImage:(UIImage *)image{
    
    CGSize size = image.size;
    CGFloat wh = MIN(size.width, size.height);
    return CGSizeMake(wh, wh);
}

//截屏
+ (UIImage *)curScreen{
    
    return [self cutFromView:[UIApplication sharedApplication].keyWindow];
}

//从给定的view中截图，UIView - > UIImage
+ (UIImage *)cutFromView:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    [[UIColor clearColor] setFill];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//根据frame截取图片
- (UIImage *)cutWithFrame:(CGRect)frame{
    
    CGImageRef cgImage = CGImageCreateWithImageInRect(self.CGImage, frame);
    
    UIImage *newImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return newImage;
}

//压缩图片至指定尺寸
- (UIImage *)rescaleImageToSize:(CGSize)size{
    
    CGRect rect = (CGRect){CGPointZero, size};
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self drawInRect:rect];
    
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resImage;
}

//压缩图片至指定像素
- (UIImage *)rescaleImageToPX:(CGFloat)toPX{

    CGSize size = self.size;
    
    if (size.width <= toPX && size.height <= toPX) {
        return self;
    }
    
    CGFloat scale = size.width / size.height;
    
    if (size.width > size.height) {
        
        size.width = toPX;
        size.height = size.width / scale;
    }
    else{
        
        size.height = toPX;
        size.width = size.height * scale;
    }
    
    return [self rescaleImageToSize:size];
}

//指定大小生成一个平铺的图片
- (UIImage *)getTiledImageWithSize:(CGSize)size{
    
    UIView *tempView = [UIView new];
    tempView.bounds = (CGRect){CGPointZero, size};
    tempView.backgroundColor = [UIColor colorWithPatternImage:self];
    
    UIGraphicsBeginImageContext(size);
    [tempView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return bgImage;
}

//将两个图片生成一张图片
+ (UIImage *)mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage{
    
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    
    CGSize mergeSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergeSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
