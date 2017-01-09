//
//  NSObject+CHTSwizzling.h
//  CHTGithub
//
//  Created by cht on 16/12/15.
//  Copyright © 2016年 cht. All rights reserved.
//

#import <Foundation/Foundation.h>

//Base on http://www.jianshu.com/p/f6dad8e1b848

@interface NSObject (CHTSwizzling)


/**
 交换一个实例方法的实现

 @param class 交换方法的类
 @param oldSelector 原实例方法的实现
 @param newSelector 新实例方法的实现
 */
+ (void)instanceMethodSwizzleWithClass:(Class)class oldSelector:(SEL)oldSelector newSelectir:(SEL)newSelector;


/**
 交换一个类方法的实现

 @param class 交换方法的类
 @param oldSelector 原类方法的实现
 @param newSelector 新类方法的实现
 */
+ (void)classMethodSwizzleWithClass:(Class)class oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;


/**
 交换当前类的类方法的实现

 @param oldSelector 原类方法的实现
 @param newSelector 新类方法的实现
 */
+ (void)classMethodSwizzleWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;

/**
 交换当前实例方法的实现
 
 @param oldSelector 原实例方法的实现
 @param newSelector 新实例方法的实现
 */
+ (void)instanceMethodSwizzleWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;



@end
