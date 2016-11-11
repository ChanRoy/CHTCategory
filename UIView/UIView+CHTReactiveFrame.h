//
//  UIView+CHTReactiveFrame.h
//  CHTGithub
//
//  Created by cht on 16/11/11.
//  Copyright © 2016年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CHTReactiveFrame)

- (UIView *(^)(CGFloat))X;
- (UIView *(^)(CGFloat))Y;
- (UIView *(^)(CGFloat))Width;
- (UIView *(^)(CGFloat))Height;
- (UIView *(^)(CGFloat))CenterX;
- (UIView *(^)(CGFloat))CenterY;
- (UIView *(^)(CGPoint))Origin;
- (UIView *(^)(CGSize))Size;

@end
