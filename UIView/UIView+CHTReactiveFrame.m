//
//  UIView+CHTReactiveFrame.m
//  CHTGithub
//
//  Created by cht on 16/11/11.
//  Copyright © 2016年 cht. All rights reserved.
//

#import "UIView+CHTReactiveFrame.h"

@implementation UIView (CHTReactiveFrame)

- (UIView *(^)(CGFloat))X{
    
    return ^UIView *(CGFloat x){
        
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))Y{
    
    return ^UIView *(CGFloat y){
        
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))Width{
    
    return ^UIView *(CGFloat width){
        
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))Height{
    
    return ^UIView *(CGFloat height){
        
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))CenterX{
    
    return ^UIView *(CGFloat centerX){
        
        CGPoint center = self.center;
        center.x = centerX;
        self.center = center;
        return self;
    };
}

- (UIView *(^)(CGFloat))CenterY{
    
    return ^UIView *(CGFloat centerY){
        
        CGPoint center = self.center;
        center.y = centerY;
        self.center = center;
        return self;
    };
}

- (UIView *(^)(CGPoint))Origin{
    
    return ^UIView *(CGPoint origin){
        
        CGRect frame = self.frame;
        frame.origin = origin;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGSize))Size{
    
    return ^UIView *(CGSize size){
        
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        return self;
    };
}


@end
