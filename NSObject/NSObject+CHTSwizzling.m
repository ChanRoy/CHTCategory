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

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector swizzlingSelector:(SEL)swizzlingSelector{
    
    Class class = [self class];
    //原有方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    //准备替换的自定义方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzlingSelector);
    
    //尝试给源SEL添加IMP，避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        //添加成功，说明源SEL没有实现IMP，将源SEL的IMP替换为准备替换的SEL的IMP
        class_replaceMethod(class, swizzlingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        //添加失败，说明源SEL已经实现IMP，直接交换两个SEL的IMP即可
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



@end
