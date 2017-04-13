//
//  UIView+CHTGradient.m
//  CHTGithub
//
//  Created by cht on 2017/3/16.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIView+CHTGradient.h"

@implementation UIView (CHTGradient)

- (void)setGradientLayer:(CAGradientLayer *)gradientLayer{
    
    objc_setAssociatedObject(self, @selector(gradientLayer), gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)gradientLayer{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors locations:(NSArray <NSNumber *>*)locations direction:(CHTGradientDirection)direction{
    
    if (self.gradientLayer) {
        
        [self.gradientLayer removeFromSuperlayer];
    }
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.locations = locations;
    NSMutableArray *cgColors = [NSMutableArray new];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [cgColors addObject:(id)obj.CGColor];
    }];
    self.gradientLayer.colors = cgColors;
    
    switch (direction) {
        case CHTGradientDirectionTopToBottom:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 1);
        }
            break;
        case CHTGradientDirectionBottomToTop:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 1);
            self.gradientLayer.endPoint = CGPointMake(0, 0);
        }
            break;
        case CHTGradientDirectionLeftToRight:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
        }
            break;
        case CHTGradientDirectionRightToLeft:
        {
            self.gradientLayer.startPoint = CGPointMake(1, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 0);
        }
            break;
        default:
            break;
    }
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

//default with two color
- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors direction:(CHTGradientDirection)direction{
    
    [self setGradientColorWithColors:colors locations:nil direction:direction];
}

@end
