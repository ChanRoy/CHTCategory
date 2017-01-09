//
//  NSMutableArray+CHTStack.m
//  CHTGithub
//
//  Created by cht on 17/1/9.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "NSMutableArray+CHTStack.h"

@implementation NSMutableArray (CHTStack)

- (void)pushAnObject:(id)obj{
    
    [self addObject:obj];
}

- (id)popObject{
    
    id obj = [self lastObject];
    if (self.count) {
        [self removeLastObject];
    }
    return obj;
}

- (id)peekObject{
    
    return [self lastObject];
}

@end
