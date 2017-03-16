//
//  UIImage+CHTGradient.h
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

@interface UIImage (CHTGradient)

/**
 return a radient image

 @param colors: radient colors
 @param frame: image frame
 @param direction: radient direction
 @return a radient image
 */
+ (UIImage *)imageWithRadientColors:(NSArray <UIColor *>*)colors frame:(CGRect)frame direction:(CHTGradientDirection)direction;

@end
