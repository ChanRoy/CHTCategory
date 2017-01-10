//
//  UIDevice+CHTExtend.h
//  CHTGithub
//
//  Created by cht on 17/1/10.
//  Copyright © 2017年 cht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CHTExtend)

+ (NSString *)platform;

+ (BOOL)isSimulator;

+ (NSString *)platformString;

@end
