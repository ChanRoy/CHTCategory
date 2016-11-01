//
//  UIImage+CHTColor.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHTColor)

//生成颜色图片
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

//保持图片灰度
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

//保持图片透明度
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

//改变图片的颜色模式
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

//获取某一像素的色素
- (UIColor *)colorAtPixel:(CGPoint)point;

//获取灰度图
- (UIImage *)covertToGrayImage;

@end
