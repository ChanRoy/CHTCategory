//
//  UIView+CHTGradient.m
//  CHTGithub
//
//  Created by cht on 2017/3/16.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "UIView+CHTGradient.h"

@implementation UIView (CHTGradient)

- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors locations:(NSArray <NSNumber *>*)locations direction:(CHTGradientDirection)direction{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.locations = locations;
    NSMutableArray *cgColors = [NSMutableArray new];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [cgColors addObject:(id)obj.CGColor];
    }];
    gradientLayer.colors = cgColors;
    
    switch (direction) {
        case CHTGradientDirectionTopToBottom:
        {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1);
        }
            break;
        case CHTGradientDirectionBottomToTop:
        {
            gradientLayer.startPoint = CGPointMake(0, 1);
            gradientLayer.endPoint = CGPointMake(0, 0);
        }
            break;
        case CHTGradientDirectionLeftToRight:
        {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 0);
        }
            break;
        case CHTGradientDirectionRightToLeft:
        {
            gradientLayer.startPoint = CGPointMake(1, 0);
            gradientLayer.endPoint = CGPointMake(0, 0);
        }
            break;
        default:
            break;
    }
    [self.layer addSublayer:gradientLayer];
}

//default with two color
- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors direction:(CHTGradientDirection)direction{
    
    [self setGradientColorWithColors:colors locations:nil direction:direction];
}

@end
