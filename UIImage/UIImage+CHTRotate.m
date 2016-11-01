//
//  UIImage+CHTRotate.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/25.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "UIImage+CHTRotate.h"

//角度转弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//弧度转角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

@implementation UIImage (CHTRotate)

//纠正图片的方向
- (UIImage *)fixOrientation{
    
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:{
            
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
        }
            break;
        
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:{
            
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
        }
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:{
            
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
        }
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:{
            
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
        }
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:{
            
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
        }
            break;
        case UIImageOrientationUp:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
        case UIImageOrientationDown:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef context = CGBitmapContextCreate(NULL, self.size.width, self.size.height, CGImageGetBitsPerComponent(self.CGImage), 0, CGImageGetColorSpace(self.CGImage), CGImageGetAlphaInfo(self.CGImage));
    CGContextConcatCTM(context, transform);
    
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:{
            
            CGContextDrawImage(context, CGRectMake(0, 0, self.size.height, self.size.width), self.CGImage);
        }
            break;
        default:{
            
            CGContextDrawImage(context, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
        }
            break;
    }
    
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGContextRelease(context);
    CGImageRelease(cgImage);
    
    return image;
}

//按给定的方向旋转图片
- (UIImage *)rotate:(UIImageOrientation)orient{
    
    CGRect bounds = CGRectZero;
    UIImage *copy = nil;
    CGContextRef context = nil;
    CGImageRef cgImage = self.CGImage;
    CGRect rect = CGRectZero;
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    rect.size.width = CGImageGetWidth(cgImage);
    rect.size.height = CGImageGetHeight(cgImage);
    
    bounds = rect;
    
    switch (orient) {
        case UIImageOrientationUp:
            return self;
            break;
        case UIImageOrientationUpMirrored:{
            
            transform = CGAffineTransformMakeTranslation(rect.size.width, 0.0);
            transform = CGAffineTransformScale(transform, -1, 1);
        }
            break;
        case UIImageOrientationDown:{
            
            transform = CGAffineTransformMakeTranslation(rect.size.width, rect.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
        }
            break;
        case UIImageOrientationDownMirrored:{
            
            transform = CGAffineTransformMakeTranslation(0.0, rect.size.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
        }
            break;
        case UIImageOrientationLeft:{
            
            bounds = swapWidthAndHeight(bounds);
            transform = CGAffineTransformMakeTranslation(0.0, rect.size.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
        }
            break;
        case UIImageOrientationLeftMirrored:{
            
            bounds = swapWidthAndHeight(bounds);
            transform = CGAffineTransformMakeTranslation(rect.size.height, rect.size.width);
            transform = CGAffineTransformScale(transform, -1, 1);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
        }
            break;
        case UIImageOrientationRight:{
            
            bounds = swapWidthAndHeight(bounds);
            transform = CGAffineTransformMakeTranslation(rect.size.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
        }
            break;
        case UIImageOrientationRightMirrored:{
            
            bounds = swapWidthAndHeight(bounds);
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
        }
            break;
        default:
            return self;
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    context = UIGraphicsGetCurrentContext();
    
    switch (orient) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:{
            
            CGContextScaleCTM(context, -1.0, 1.0);
            CGContextTranslateCTM(context, -rect.size.height, 0.0);
        }
            break;
        default:{
            
            CGContextScaleCTM(context, 1.0, -1.0);
            CGContextTranslateCTM(context, 0.0, -rect.size.height);
        }
            break;
    }
    
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), rect, cgImage);
    
    copy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return copy;
}

//垂直翻转
- (UIImage *)flipVertical{
    
    return [self rotate:UIImageOrientationDownMirrored];
}

//水平翻转
- (UIImage *)filpHorizontal{
    
    return [self rotate:UIImageOrientationUpMirrored];
}

//将图片旋转角度degrees
- (UIImage *)imageRotateByDegrees:(CGFloat)degrees{
 
    return [self imageRotateByDegrees:kDegreesToRadian(degrees)];
}

//将图片旋转弧度radians
- (UIImage *)imageRotateByRadians:(CGFloat)radians{
    
    // calculate the size of the rotated view's containing box for our drawing space
    UIView *rotateViewBox = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGAffineTransform transform = CGAffineTransformMakeRotation(radians);
    rotateViewBox.transform = transform;
    CGSize rotatedSize = rotateViewBox.frame.size;
    
    // Create the bitmap context
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    // Rotate the image context
    CGContextRotateCTM(bitmap, radians);
    
    // Now, draw the rotated/scaled image into the context
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width/2, -self.size.height/2, self.size.width, self.size.height), self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
}

//交换宽和高
static CGRect swapWidthAndHeight(CGRect rect){
    
    CGFloat swap = rect.size.width;
    
    rect.size.width = rect.size.height;
    rect.size.height = swap;
    
    return rect;
}

@end
