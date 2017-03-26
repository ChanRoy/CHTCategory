//
//  UIView+CHTRadius.m
//  CHTGithub
//
//  Created by cht on 2017/3/6.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIView+CHTRadius.h"

@implementation UIView (CHTRadius)

- (void)cht_setRadius:(CGFloat)radius roundingCorners:(UIRectCorner)rectCorner{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
