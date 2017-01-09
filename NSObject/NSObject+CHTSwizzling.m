//
//  NSObject+CHTSwizzling.m
//  CHTGithub
//
//  Created by cht on 16/12/15.
//  Copyright © 2016年 cht. All rights reserved.
//

#import "NSObject+CHTSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (CHTSwizzling)

+ (void)instanceMethodSwizzleWithClass:(Class)class oldSelector:(SEL)oldSelector newSelectir:(SEL)newSelector{
    
    //原有方法
    Method oldMethod = class_getInstanceMethod(class, oldSelector);
    //准备替换的自定义方法
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    //尝试给源SEL添加IMP，避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    if (didAddMethod) {
        //添加成功，说明源SEL没有实现IMP，将源SEL的IMP替换为准备替换的SEL的IMP
        class_replaceMethod(class, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    }else{
        //添加失败，说明源SEL已经实现IMP，直接交换两个SEL的IMP即可
        method_exchangeImplementations(oldMethod, newMethod);
    }
}

+ (void)classMethodSwizzleWithClass:(Class)class oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector{
    
    class = object_getClass(class);
    [self instanceMethodSwizzleWithClass:class oldSelector:oldSelector newSelectir:newSelector];
}

+ (void)classMethodSwizzleWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector{
    
    Class class = [self class];
    [self classMethodSwizzleWithClass:class oldSelector:oldSelector newSelector:newSelector];
}

+ (void)instanceMethodSwizzleWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector{
    
    Class class = [self class];
    [self instanceMethodSwizzleWithClass:class oldSelector:oldSelector newSelectir:newSelector];
}



@end
