//
//  UIImage+CHTCustomImage.h
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CHTCustomImage)

//给图片画圆角，不使用离屏渲染

//DIY clip -> 最快
- (UIImage *)cht_imageClip:(CGFloat)cornerRadius;

//CGContext clip -> 第二快
- (UIImage *)CGContextSetImageCornerRadius:(CGFloat)cornerRadius;

//UIBezierPath clip -> 最慢
- (UIImage *)UIBezierPathClip:(CGFloat) cornerRadius;



@end
