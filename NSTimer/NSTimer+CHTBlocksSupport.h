//
//  NSTimer+CHTBlocksSupport.h
//  CHTOCTest
//
//  Created by cht on 2017/9/1.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (CHTBlocksSupport)


/**
 solve the problem of retain cycle while using NSTimer

 @param interval timer interval
 @param block action block
 @param repeats if repeat
 @return timer
 */
+ (NSTimer *)cht_scheduledTimerWithTimeInterval: (NSTimeInterval)interval
                                          block: (void(^)(void))block
                                        repeats: (BOOL)repeats;

@end
