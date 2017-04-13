//
//  UIView+CHTGradient.h
//  CHTGithub
//
//  Created by cht on 2017/3/16.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    CHTGradientDirectionTopToBottom = 0,//gradient top to bottom
    CHTGradientDirectionBottomToTop,    //gradient bottom to top
    CHTGradientDirectionLeftToRight,    //gradient left to right
    CHTGradientDirectionRightToLeft,    //gradient right to left
    
} CHTGradientDirection;

/**
 UIView set gradient color
 */
@interface UIView (CHTGradient)

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

/**
 set gradient color

 @param colors gradient color
 @param locations location to change colors, the number must range of 0.0 - 1.0
 @param direction direction to gradient
 */
- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors locations:(NSArray <NSNumber *>*)locations direction:(CHTGradientDirection)direction;

//default top to bottom with two color
- (void)setGradientColorWithColors:(NSArray <UIColor *>*)colors direction:(CHTGradientDirection)direction;

@end
