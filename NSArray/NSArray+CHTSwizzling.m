//
//  NSArray+CHTSwizzling.m
//  CHTGithub
//
//  Created by cht on 16/12/19.
//  Copyright © 2016年 cht. All rights reserved.
//

#import "NSArray+CHTSwizzling.h"
#import "NSObject+CHTSwizzling.h"
#import <objc/runtime.h>

@implementation NSArray (CHTSwizzling)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayI") classMethodSwizzleWithOldSelector:@selector(objectAtIndex:) newSelector:@selector(safeObjectAtIndex:)];
    });
}

- (id)safeObjectAtIndex:(NSInteger)index{
    
    if (self.count <= 0) {
        NSLog(@"%s can not get a object from a empty array",__FUNCTION__);
        return nil;
    }
    if (index > self.count) {
        NSLog(@"%s index out of bounds of array",__FUNCTION__);
        return nil;
    }
    else{
        return [self safeObjectAtIndex:index];
    }
}


@end
