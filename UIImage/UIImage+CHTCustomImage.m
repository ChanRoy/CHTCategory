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
//参考：http://www.jianshu.com/p/bbb50b2cb7e6

//CGContext clip
- (UIImage *)CGContextSetImageCornerRadius:(CGFloat)cornerRadius{
    
    int w = self.size.width * self.scale;
    int h = self.size.height * self.scale;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), false, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, cornerRadius);
    CGContextAddArcToPoint(context, 0, 0, cornerRadius, 0, cornerRadius);
    CGContextAddLineToPoint(context, w - cornerRadius, 0);
    CGContextAddArcToPoint(context, w, 0, w, cornerRadius, cornerRadius);
    CGContextAddLineToPoint(context, w, h - cornerRadius);
    CGContextAddArcToPoint(context, w, h, w - cornerRadius, h, cornerRadius);
    CGContextAddLineToPoint(context, cornerRadius, h);
    CGContextAddArcToPoint(context, 0, h, 0, h - cornerRadius, cornerRadius);
    CGContextAddLineToPoint(context, 0, cornerRadius);
    CGContextClosePath(context);
    
    CGContextClip(context);
    [self drawInRect:CGRectMake(0, 0, w, h)];
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//UIBezierPath clip
- (UIImage *)UIBezierPathClip:(CGFloat) cornerRadius{
    
    int w = self.size.width * self.scale;
    int h = self.size.height * self.scale;
    CGRect rect = CGRectMake(0, 0, w, h);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), false, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius] addClip];
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//DIY clip
- (UIImage *)cht_imageClip:(CGFloat)cornerRadius{
    
    //1.CGDataProviderRef 把CGImage 转为 二进制流
    CGDataProviderRef provider = CGImageGetDataProvider(self.CGImage);
    void *imgData = (void *)CFDataGetBytePtr(CGDataProviderCopyData(provider));
    int width = self.size.width * self.scale;
    int height = self.size.height * self.scale;
    
    //2.处理imgData
    cornerImage(imgData, width, height, cornerRadius);
    
    //3.CGDataProviderRef 把二进制流 转为 CGImage
    CGDataProviderRef pv = CGDataProviderCreateWithData(NULL, imgData, width * height * 4, releaseData);
    CGImageRef content = CGImageCreate(width, height, 8, 32, 4 * width, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast, pv, NULL, true, kCGRenderingIntentDefault);
    UIImage *newImage = [UIImage imageWithCGImage:content];
    
    //释放空间
    CGDataProviderRelease(pv);
    CGImageRelease(content);
    
    return newImage;
}

void releaseData(void *info, const void *data, size_t size){
    
    free((void *)data);
}

void cornerImage(UInt32 *const img, int w, int h, CGFloat cornerRadius){
    
    CGFloat c = cornerRadius;
    CGFloat min = w > h ? h : w;
    
    if (c < 0) { c = 0; }
    if (c > min / 2) { c = min /2; }
    
    // 左上 y:[0, c), x:[0, c-y)
    for (int y = 0; y < c; y ++) {
        for (int x = 0; x < c - y; x++) {
            UInt32 *p = img + y * w + x;
            if (isInCircle(c, c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    //右上 y:[0, c), x:[w-c+y, w)
    int temp = w - c;
    for (int y = 0; y < c; y ++) {
        for (int x = temp + y; x < w; x++) {
            //p: 32位指针，RGBA排列，各8位
            UInt32 *p = img + y * w + x;
            if (isInCircle(w-c, c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    //左下 y:[h-c, h), x:[0, y-h+c)
    temp = h - c;
    for (int y = h - c; y < h; y ++) {
        for (int x = 0; x < y - temp; x ++) {
            UInt32 *p = img + y * w + x;
            if (isInCircle(c, h - c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    //右下 y:[h - c,h), x:[w-c+h-y, w)
    temp = w-c+h;
    for (int y = h - c; y < h; y ++) {
        for (int x = temp - y; x < w; x ++) {
            UInt32 *p = img + y * w + x;
            if (isInCircle(w-c, h-c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    
}

//判断点(px, py) 在不在圆心为(cx, cy) 半径为r的圆内
static inline bool isInCircle(float cx, float cy, float r, float px, float py){
    
    if ((px-cx) * (px-cx) + (py-cy) * (py-cy) > r * r) {
        return false;
    }
    return true;
}

@end
