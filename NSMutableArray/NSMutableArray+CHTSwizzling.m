//
//  NSMutableArray+CHTSwizzling.m
//  CHTGithub
//
//  Created by cht on 16/12/19.
//  Copyright © 2016年 cht. All rights reserved.
//

#import "NSMutableArray+CHTSwizzling.h"
#import "NSObject+CHTSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (CHTSwizzling)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(addObject:) swizzlingSelector:@selector(safeAddObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObject:) swizzlingSelector:@selector(safeRemoveObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(insertObject:atIndex:) swizzlingSelector:@selector(safeInsertObject:atIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) swizzlingSelector:@selector(safeObjectAtIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObjectAtIndex:) swizzlingSelector:@selector(safeRemoveObjectAtIndex:)];
    });
}


- (void)safeAddObject:(id)obj{
    
    if (obj == nil) {
        NSLog(@"====");
        NSLog(@"%s can not add a nil object into NSMutableArray",__FUNCTION__);
    }else{
        [self safeAddObject:obj];
    }
}

- (void)safeRemoveObject:(id)obj{
    
    if (obj == nil) {
        NSLog(@"%s call removeObject, but argument object is nil",__FUNCTION__);
    }else{
        [self safeRemoveObject:obj];
    }
}

- (void)safeInsertObject:(id)obj atIndex:(NSInteger)index{
    
    if (obj == nil) {
        NSLog(@"%s can not insert a nil object into NSMutableArray",__FUNCTION__);
    }else if (index > self.count){
        NSLog(@"%s index is invalid",__FUNCTION__);
    }else{
        [self safeInsertObject:obj atIndex:index];
    }
}

- (id)safeObjectAtIndex:(NSInteger)index{
    
    if (self.count == 0) {
        NSLog(@"%s can not get any object from a empty array",__FUNCTION__);
        return nil;
    }
    if (index > self.count) {
        NSLog(@"%s index out of bounds in array",__FUNCTION__);
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (void)safeRemoveObjectAtIndex:(NSInteger)index{
    
    if (self.count <= 0) {
        NSLog(@"%s can not remove any object from a empty array",__FUNCTION__);
    }else if (index > self.count){
        NSLog(@"%s index out of bounds in array",__FUNCTION__);
    }else{
        [self safeRemoveObjectAtIndex:index];
    }
}

@end
