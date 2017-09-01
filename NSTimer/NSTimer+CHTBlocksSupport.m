//
//  NSTimer+CHTBlocksSupport.m
//  CHTOCTest
//
//  Created by cht on 2017/9/1.
//  Copyright © 2017年 cht. All rights reserved.
//

#import "NSTimer+CHTBlocksSupport.h"

@implementation NSTimer (CHTBlocksSupport)

+ (NSTimer *)cht_scheduledTimerWithTimeInterval: (NSTimeInterval)interval
                                          block: (void(^)(void))block
                                        repeats: (BOOL)repeats {
    
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(cht_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)cht_blockInvoke: (NSTimer *)timer {
    
    void (^block)(void) = timer.userInfo;
    if (block) {
        
        block();
    }
}

@end
