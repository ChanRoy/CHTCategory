//
//  UIImage+CHTRotate.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/25.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHTRotate)

//纠正图片的方向
- (UIImage *)fixOrientation;

//按给定的方向旋转图片
- (UIImage *)rotate:(UIImageOrientation)orient;

//垂直翻转
- (UIImage *)flipVertical;

//水平翻转
- (UIImage *)filpHorizontal;

//将图片旋转角度degrees
- (UIImage *)imageRotateByDegrees:(CGFloat)degrees;

//将图片旋转弧度radians
- (UIImage *)imageRotateByRadians:(CGFloat)radians;

@end
