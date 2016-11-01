//
//  UIImage+CHTCut.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHTCut)

@property (nonatomic, strong, readonly) UIImage *roundImage;

//截屏
+ (UIImage *)curScreen;

//根据frame截取图片
- (UIImage *)cutWithFrame:(CGRect)frame;

//从给定的view中截图，UIView - > UIImage
+ (UIImage *)cutFromView:(UIView *)view;

//压缩图片至指定尺寸
- (UIImage *)rescaleImageToSize:(CGSize)size;

//压缩图片至指定像素
- (UIImage *)rescaleImageToPX:(CGFloat)toPX;

//指定大小生成一个平铺的图片
- (UIImage *)getTiledImageWithSize:(CGSize)size;

//将两个图片生成一张图片
+ (UIImage *)mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

@end
