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
- (UIImage *)setImageCornerRadius:(CGFloat)cornerRadius;

@end
