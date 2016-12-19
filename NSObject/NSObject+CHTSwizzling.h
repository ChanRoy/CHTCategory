//
//  NSObject+CHTSwizzling.h
//  CHTGithub
//
//  Created by cht on 16/12/15.
//  Copyright © 2016年 cht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CHTSwizzling)


/**
 method swizzling 把系统的方法替换为自定义方法
 Base on http://www.jianshu.com/p/f6dad8e1b848
 
 @param orginalSelector 系统的方法
 @param swizzlingSelector 自定义方法
 */
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector swizzlingSelector:(SEL)swizzlingSelector;


@end
