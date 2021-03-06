//
//  UIView+CHTExtend.m
//  CHTCategoryDemo
//
//  Created by cht on 16/9/24.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "UIView+CHTExtend.h"

@implementation UIView (CHTExtend)

#pragma mark - frame 相关

- (void)setX:(CGFloat)x{
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y{
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x{
    
    return self.frame.origin.x;
}

- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height{
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)width{
    
    return self.frame.size.width;
}

- (CGFloat)height{
    
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX{
    
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX{
    
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY{
    
    return self.center.y;
}

- (void)setSize:(CGSize)size{
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size{
    
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin{
    
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin{

    return self.frame.origin;
}

- (void)setRadius:(CGFloat)radius{
    
    if(radius <= 0) radius = self.bounds.size.width * 0.5f;
    
    self.layer.cornerRadius = radius;
    
    self.layer.masksToBounds = YES;
}

- (CGFloat)radius{
    
    return 0;
}

#pragma mark - others
- (void)setBorder:(UIColor *)color width:(CGFloat)width{
    
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

//获取view的controller
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
